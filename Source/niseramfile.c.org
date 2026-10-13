//  MZ-2000 Multi-function RAMFILE card 'Niseramfile'
//
//  MZ-1R12: Boot device for MZ-2000
//  MZ-1R13: Kanji ROM
//  PIO-3034: EMM

//  MZ-2000 extention slot
//  GP0-7:  D0-7
//  GP8-23: A0-15
//  GP25: RESET -> Interrupt
//  GP28: MERQ
//  GP29: IORQ
//  GP30: WR
//  GP31: RD
//  GP32: EXWAIT

#define FLASH_INTERVAL 300      // 5sec

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "pico/sync.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "hardware/timer.h"
#include "hardware/uart.h"
#include "hardware/flash.h"
#include "hardware/sync.h"
#include "hardware/vreg.h"

#include "vga16_graphics.h"

#include "misc.h"
//#include "hardware/xip_cache.h"

#define RESET_PIN 25

// RAM configuration
// MZ-1R12: 32KiB
// EMM:    320KiB

uint8_t __attribute__  ((aligned(sizeof(unsigned char *)*4096))) mz1r12[0x10000];
uint8_t __attribute__  ((aligned(sizeof(unsigned char *)*4096))) mz1r18[0x10000];
uint8_t __attribute__  ((aligned(sizeof(unsigned char *)*4096))) emm[0x50000];

// PCG emulation (33KiB)
//// VRAM  4KiB
//// CGRAM 4Kib
//// PCG   24KiB
//// COLOR 256Byte
// GRAPHIC (48KiB)

uint8_t vram[0x2000];
uint8_t cgram[0x1000];
uint8_t pcg[0x2000 * 3];
uint8_t tcolor[0x100];

// 16KB x3 plane
uint8_t gvramb[0x4000];
uint8_t gvramr[0x4000];
uint8_t gvramg[0x4000];

volatile uint8_t vram_enabled;
volatile uint8_t pcg_enabled;
volatile uint8_t text40_mode=0;
volatile uint8_t graphic_write_enable=0;
volatile uint8_t graphic_write_plane=0;
volatile uint8_t graphic_enable=0;
volatile uint8_t graphic_plane_enable = 0x07;
// bit0 = B plane
// bit1 = R plane
// bit2 = G plane

uint8_t screen_bg_color = 0; // 0〜7 (MZパレットindex)

// GRAPHIC color priority
uint8_t graphic_prio[8] = {
    0, // color0 transparent
    0, // behind TEXT
    0, // over TEXT
    0,
    0,
    0,
    0,
    0
};
/*

0 = TEXT優先（TEXTがあれば描かない）

1 = GRAPHIC優先（必ず描く）

*/

#define MAXROMPAGE 64       // =  32KiB * 64 pages =  2MiB
#define MAXEMMPAGE 32       // = 320KiB * 32 pages = 10MiB

volatile uint8_t rompage=0;  // Page No of MZ-1R12 (64KiB/page)
volatile uint8_t emmpage=0;  // Page No of EMM (320KiB/page)

volatile uint32_t kanjiptr=0;
volatile uint32_t dictptr=0;
volatile uint32_t select_kanji=0;
volatile uint32_t kanjictl=0;
volatile uint32_t mz1r18ptr=0;
volatile uint32_t mz1r12ptr=0;
volatile uint32_t emmptr=0;
volatile uint16_t tclptr=0;
volatile uint32_t flash_command=0;
volatile uint32_t font_ptr=0;
volatile uint32_t tcolor_ptr=0;
volatile uint32_t pcg_ptr=0;

// ROM configuration
// WeACT RP2350B with 16MiB Flash
// FONT ROM         4KiB   @ 0x1001f000
// Kanji ROM        128KiB @ 0x10020000
// Jisho ROM        256KiB @ 0x10040000
// Data for 1R12    32KiB  * 64 = 2MiB  @ 0x10080000
// Data for EMM     320KiB * 32 = 10MiB @ 0x10280000

#define ROMBASE 0x10080000u

uint8_t *fontrom=(uint8_t *)(ROMBASE-0x61000);
uint8_t *kanjirom=(uint8_t *)(ROMBASE-0x60000);
uint8_t *jishorom=(uint8_t *)(ROMBASE-0x40000);
uint8_t *romslots=(uint8_t *)(ROMBASE);
uint8_t *emmslots=(uint8_t *)(ROMBASE+(0x8000*MAXROMPAGE));

// VGA Output
uint8_t scandata[640];
//uint8_t scandata[320];
extern unsigned char vga_data_array[];
volatile uint32_t video_hsync,video_vsync,scanline,vsync_scanline;
volatile uint8_t pcg_control;
volatile uint8_t pcg700_control,pcg700_data;
volatile uint8_t pcg_bank;
uint8_t pallet[8];
uint8_t gpallet[8];

uint8_t colors[16]; // DUMMY

//uint8_t __attribute__  ((aligned(sizeof(unsigned char *)*4096))) flash_buffer[4096];

void __not_in_flash_func(mzscan)(uint8_t scan);
void __not_in_flash_func(mzscan80)(uint8_t scan);
void __not_in_flash_func(mzscan40)(uint8_t scan);

// *REAL* H-Sync for emulation
void __not_in_flash_func(hsync_handler)(void) {

    uint32_t vramindex;
    uint32_t tmsscan;
    uint8_t bgcolor;

    pio_interrupt_clear(pio0, 0);

    if((scanline!=0)&&(gpio_get(VSYNC)==0)) { // VSYNC
        scanline=0;
        video_vsync=1;
    } else {
        scanline++;
    }

    if((scanline%2)==0) {
        video_hsync=1;

        // VDP Draw on HSYNC

        // VGA Active starts scanline 35
        //          Active scanline 78(0) to 477(199)

        if((scanline>=73)&&(scanline<=472)) {
//        if((scanline>=81)&&(scanline<=480)) {

            tmsscan=(scanline-73)/2;
//            tmsscan=(scanline-81)/2;
            vramindex=(tmsscan%4)*640;
//            vramindex=(tmsscan%4)*320;

            mzscan(tmsscan);

            for(int j=0;j<640;j++) {
//            for(int j=0;j<320;j++) {
                vga_data_array[vramindex+j]=scandata[j];
            }           
        }

    }

    return;

}

//
//  reset

void __not_in_flash_func(z80reset)(uint gpio,uint32_t event) {

//    gpio_acknowledge_irq(RESET_PIN,GPIO_IRQ_EDGE_FALL);
    gpio_acknowledge_irq(RESET_PIN,GPIO_IRQ_EDGE_RISE);

    if(gpio_get(RESET_PIN)==0) return;

    kanjiptr=0;
    dictptr=0;
    kanjictl=0;
	select_kanji=0;
    mz1r18ptr=0;
    mz1r12ptr=0;
    emmptr=0;
    tclptr=0;
    pcg_control=0;

    vram_enabled=0;
    pcg_enabled=0xff;
	pcg_bank=0;

	text40_mode=0;
	graphic_write_enable=0;
	graphic_write_plane=0;
	graphic_enable=0;
	graphic_plane_enable = 0x07;
	screen_bg_color = 0;
	
	memcpy(cgram,fontrom,0x1000);

	for(uint16_t offset=0;offset<0x100;offset++){
		tcolor[offset]=0x70;
	}

	for(int i=0;i<8;i++) {
        pallet[i]=i;
    }

    for(int i=0;i<8;i++) {
        gpallet[i]=i;
    }

	for(int i=0;i<8;i++) {
		graphic_prio[i]=0;
	}

    for(uint16_t i=0;i<0x2000;i++) {
        vram[i]=0;
    }

    for(uint16_t i=0;i<0x4000;i++) {
        gvramb[i]=0;
        gvramr[i]=0;
        gvramg[i]=0;
    }

	return;
}

// ======================================================
// VGA Scan Dispatch
// ======================================================

void __not_in_flash_func(mzscan)(uint8_t scan)
{
    if(text40_mode)
        mzscan80(scan);
    else
        mzscan40(scan);
}


static uint8_t textbgflag[640];

void __not_in_flash_func(mzscan80)(uint8_t scan)
{

	uint8_t scany  = scan>>3;
	uint8_t scanyy = scan&7;

	uint8_t *dst=scandata;
	uint8_t *bgf=textbgflag;

	uint8_t *v=vram+(scany*80);

	uint8_t pcg1=pcg_control&1;
	uint8_t pcg2=pcg_control&2;


//---------------- TEXT + PCG ----------------

	for(int scanx=0;scanx<80;scanx++){

		uint8_t ch=*v++;

		uint8_t color=tcolor[ch]&0x77;

		uint8_t fg=(color>>4)&7;
		uint8_t bg=color&7;

		uint8_t font=cgram[(ch<<3)+scanyy];

		uint32_t *bf=&bitexpand[(uint32_t)font<<2];

		uint32_t f1=bf[1]*fg;
		uint32_t f2=bf[0]*fg;

		uint32_t b1=bf[3]*bg;
		uint32_t b2=bf[2]*bg;

		uint32_t p1=0;
		uint32_t p2=0;

// PCG

		if(pcg1){
			uint32_t base=(ch<<3)+scanyy;

			uint32_t *bb=&bitexpand[(uint32_t)pcg[base]<<2];
			uint32_t *br=&bitexpand[(uint32_t)pcg[base+0x2000]<<2];
			uint32_t *bgp=&bitexpand[(uint32_t)pcg[base+0x4000]<<2];

			p1=bb[1]+br[1]*2+bgp[1]*4;
			p2=bb[0]+br[0]*2+bgp[0]*4;
		}
		uint8_t *tf1=(uint8_t*)&f1;
		uint8_t *tf2=(uint8_t*)&f2;

		uint8_t *tb1=(uint8_t*)&b1;
		uint8_t *tb2=(uint8_t*)&b2;

		uint8_t *tp1=(uint8_t*)&p1;
		uint8_t *tp2=(uint8_t*)&p2;

// 前半

		for(int i=0;i<4;i++){

			uint8_t px=tb1[i];
			uint8_t bgonly=1;

			if(pcg2){

				if(tp1[i]){ px=tp1[i]; bgonly=0; }
					else if(tf1[i]){ px=tf1[i]; bgonly=0; }

			}else{

				if(tf1[i]){ px=tf1[i]; bgonly=0; }
					else if(tp1[i]){ px=tp1[i]; bgonly=0; }

			}

			*dst++=pallet[px];
			*bgf++=bgonly;
		}
// 後半

		for(int i=0;i<4;i++){

			uint8_t px=tb2[i];
			uint8_t bgonly=1;

			if(pcg2){

				if(tp2[i]){ px=tp2[i]; bgonly=0; }
					else if(tf2[i]){ px=tf2[i]; bgonly=0; }

			}else{

				if(tf2[i]){ px=tf2[i]; bgonly=0; }
					else if(tp2[i]){ px=tp2[i]; bgonly=0; }

			}

			*dst++=pallet[px];
			*bgf++=bgonly;

		}

	}


//------------- GRAPHIC -------------

	if(graphic_enable && scan<200){

		uint32_t offs=scan*80;

		uint8_t pen=graphic_plane_enable;

		uint8_t *dstg=scandata;
		uint8_t *bg=textbgflag;

		for(int bx=0;bx<80;bx++){

			uint8_t vb=(pen&1)?gvramb[offs+bx]:0;
			uint8_t vr=(pen&2)?gvramr[offs+bx]:0;
			uint8_t vg=(pen&4)?gvramg[offs+bx]:0;

			uint32_t b=
			bitexpand[vb*4]
				+bitexpand[vr*4]*2
				+bitexpand[vg*4]*4;

			uint32_t f=
			bitexpand[vb*4+1]
				+bitexpand[vr*4+1]*2
				+bitexpand[vg*4+1]*4;

			uint8_t *p1=(uint8_t*)&b;
			uint8_t *p2=(uint8_t*)&f;

			#define DRAW(px)\
				{\
					uint8_t v=(px);\
					if(v){\
						uint8_t col=gpallet[v];\
						if(graphic_prio[v] || *bg)\
							*dstg=col;\
						}\
						dstg++;\
						bg++;\
				}

				DRAW(p1[3]);
				DRAW(p1[2]);
				DRAW(p1[1]);
				DRAW(p1[0]);

				DRAW(p2[3]);
				DRAW(p2[2]);
				DRAW(p2[1]);
				DRAW(p2[0]);
			#undef DRAW
		}
	}
}

void __not_in_flash_func(mzscan40)(uint8_t scan)
{

	uint8_t scany=scan>>3;
	uint8_t scanyy=scan&7;

	uint32_t offset=scany*40;

	uint8_t *dst=scandata;
	uint8_t *bgf=textbgflag;

	uint8_t pcg1=pcg_control&1;
	uint8_t pcg2=pcg_control&2;


// TEXT

	for(int x=0;x<40;x++){

		uint8_t ch=vram[offset++];

		uint8_t color=tcolor[ch]&0x77;

		uint8_t fg=(color>>4)&7;
		uint8_t bg=color&7;

		uint8_t font=cgram[(ch<<3)+scanyy];

		uint32_t *bf=&bitexpand[(uint32_t)font<<2];

		uint32_t f1=bf[0]*fg;
		uint32_t f2=bf[1]*fg;

		uint32_t b1=bf[2]*bg;
		uint32_t b2=bf[3]*bg;

		uint32_t p1=0,p2=0;

		if(pcg1){

			uint32_t base=(ch<<3)+scanyy;

			uint32_t *bb=&bitexpand[(uint32_t)pcg[base]<<2];
			uint32_t *br=&bitexpand[(uint32_t)pcg[base+0x2000]<<2];
			uint32_t *bgp=&bitexpand[(uint32_t)pcg[base+0x4000]<<2];

			p1=bb[0]+br[0]*2+bgp[0]*4;
			p2=bb[1]+br[1]*2+bgp[1]*4;
		}

		uint8_t *tf1=(uint8_t*)&f1;
		uint8_t *tf2=(uint8_t*)&f2;

		uint8_t *tb1=(uint8_t*)&b1;
		uint8_t *tb2=(uint8_t*)&b2;

		uint8_t *tp1=(uint8_t*)&p1;
		uint8_t *tp2=(uint8_t*)&p2;

		uint8_t buf[8];
		uint8_t bgfbuf[8];

		for(int i=0;i<4;i++){

			uint8_t px=tb1[i];
			uint8_t bgonly=1;

			if(pcg2){

				if(tp1[i]){px=tp1[i];bgonly=0;}
					else if(tf1[i]){px=tf1[i];bgonly=0;}

			}else{

				if(tf1[i]){px=tf1[i];bgonly=0;}
					else if(tp1[i]){px=tp1[i];bgonly=0;}

			}

			buf[i+4]=px;
			bgfbuf[i+4]=bgonly;
		}

		for(int i=0;i<4;i++){

			uint8_t px=tb2[i];
			uint8_t bgonly=1;

			if(pcg2){

				if(tp2[i]){px=tp2[i];bgonly=0;}
					else if(tf2[i]){px=tf2[i];bgonly=0;}

		}else{

			if(tf2[i]){px=tf2[i];bgonly=0;}
				else if(tp2[i]){px=tp2[i];bgonly=0;}

		}

		buf[i]=px;
		bgfbuf[i]=bgonly;
	}


// double x

		for(int i=0;i<8;i++){

			uint8_t col=pallet[buf[i]];

			*dst++=col;
			*dst++=col;

			*bgf++=bgfbuf[i];
			*bgf++=bgfbuf[i];

		}

	}
// GRAPHIC

	if(graphic_enable && scan<200){

		uint32_t offs=scan*80;

		uint8_t pen=graphic_plane_enable;

		uint8_t *dstg=scandata;
		uint8_t *bg=textbgflag;

		for(int bx=0;bx<80;bx++){

			uint8_t vb=(pen&1)?gvramb[offs+bx]:0;
			uint8_t vr=(pen&2)?gvramr[offs+bx]:0;
			uint8_t vg=(pen&4)?gvramg[offs+bx]:0;

			uint32_t b=
				bitexpand[vb*4]
				+bitexpand[vr*4]*2
				+bitexpand[vg*4]*4;

			uint32_t f=
				bitexpand[vb*4+1]
				+bitexpand[vr*4+1]*2
				+bitexpand[vg*4+1]*4;

			uint8_t *p1=(uint8_t*)&b;
			uint8_t *p2=(uint8_t*)&f;

			#define DRAW(px)\
			{\
				if(px){\
					uint8_t col=gpallet[px];\
					if(graphic_prio[px] || *bg)\
						*dstg=col;\
				}\
				dstg++;\
				bg++;\
			}

			DRAW(p1[3]);
			DRAW(p1[2]);
			DRAW(p1[1]);
			DRAW(p1[0]);

			DRAW(p2[3]);
			DRAW(p2[2]);
			DRAW(p2[1]);
			DRAW(p2[0]);

			#undef DRAW

		}
	}
}


static inline void io_write(uint16_t address, uint8_t data)
{

    uint8_t b;

    switch(address&0xff) {

        // MZ-1R13

        case 0xb8:  // Kanji PTR Lo
	    	kanjiptr=(kanjiptr & 0xff00) | (data << 0);
            return;

        case 0xb9:  // Kanji PTR Hi
			kanjiptr=(kanjiptr & 0x00ff) | (data << 8);
            return;

		case 0xba:
			select_kanji = ((data & 1) != 0);
            return;

    	case 0xbb:  // Kanji PTR ++
			kanjiptr++;
            return;

        // MZ-1R12

        case 0xf8:  // MZ-1R12 ptr High 
            mz1r12ptr=(data<<8)+(mz1r12ptr&0xff);
            mz1r12ptr&=0x7fff;
            return;

        case 0xf9:  // MZ-1R12 ptr Low
            mz1r12ptr=data+(mz1r12ptr&0xff00);
            return;

        //  MZ-1R12 control 

        case 0x8a:
            rompage=data&0x3f;
            flash_command=0x10000000+(data&0x3f);
            return;

        case 0x8b:
            rompage=data&0x3f;
            flash_command=0x20000000+(data&0x3f);
            return;

        case 0x8c:
            emmpage=data&0x1f;
            flash_command=0x30000000+(data&0x1f);        
            return;

        case 0x8d:
            emmpage=data&0x1f;
            flash_command=0x40000000+(data&0x1f);        
            return;

        // EMM
        case 0xa4:
            emmptr=(emmptr&0x7ff00)+(data);
            return;

        case 0xa5:
            emmptr=(emmptr&0x700ff)+(data<<8);
            return;           

        case 0xa6:
//            emmptr=(emmptr&0xffff)+(data<<16);
            emmptr=(emmptr&0xffff)+((data&7)<<16);
            return; 

        case 0xa7:
            if(emmptr>0x4ffff) {
                emmptr-=0x50000;
            }
            emm[emmptr++]=data;
            return;

//		PCG SET

    	// PCG ADDRESS RESET
    	case 0x60:
            pcg_ptr=0;
            return;
    	// PCG ADDRESS SET
        case 0x61:
    		pcg_ptr=data*8;
			return;
//        case 0xe5:  // BANK TO PCG
        case 0x62:  // BANK TO PCG
            pcg_bank=data&3;
            return;
    	// PCG WRITE & PCG ADDRESS++
        case 0x63:
            if((pcg_bank&3)!=0) {
    	 		pcg[pcg_ptr+((pcg_bank&3)-1)*0x2000]=data;
            }
    		pcg_ptr++;
            return;

    	// VGA Out

//        case 0xF0:
        case 0x67:
            pcg_control=data;
            return;

//        PALLET CONTROL
//        case 0xF1:
        case 0x68:
            pallet[(data&0x70)>>4]=data&7;
            return;

//        GRAPHIC PALLET CONTROL
//        case 0xF1:
        case 0x69:
            gpallet[(data&0x70)>>4]=data&7;
            return;

//        GRAPHIC color priority
        case 0x6A:
			graphic_prio[(data&0x70)>>4]=data&1;
            return;

    	// BANK control

//		FONT CHANGE

    	// FONT ADDRESS RESET
    	case 0x70:
            font_ptr=0;
            return;
    	// FONT WRITE & FONT ADDRESS++
        case 0x71:
            cgram[font_ptr]=data;
    		font_ptr++;
            return;
    	// FONT ADDRESS SET
        case 0x72:
    		font_ptr=data*8;
			return;

    	// FONT ADDRESS RESET
    	case 0x78:
            tcolor_ptr=0;
            return;
    	// FONT COLOR SET & FONT ADDRESS++
        case 0x79:
            tcolor[tcolor_ptr]=data;
    		tcolor_ptr++;
            return;
    	// FONT COLOR SET ADDRESS
        case 0x7a:
    		tcolor_ptr=data;
			return;

//        case 0xe3:  // BANK TO VRAM
    	case 0xe8:
    		vram_enabled = ((data & 0xC0) == 0xC0);
    		if ((data & 0xC0) == 0x80){
    			graphic_write_enable =1;
    		} else {
    			graphic_write_enable =0;
    		}
    	
    		text40_mode =  ((data & 0x20) == 0x20);
    		return;

        case 0xF7:  // BANK TO GRAM
			graphic_write_plane = (data & 0x03);
    		return;

        case 0xF6:  // BANK TO GRAM
		    graphic_enable = !!(data & 0x07);
    		graphic_plane_enable = (data & 0x07);
    		return;

        case 0xF5:  // GRAPHIC color priority
            pallet[0x07]=data&7;

            if(data & 0x08){
				for(int i=0;i<8;i++) {
				graphic_prio[i]=1;
				}
            } else {
				for(int i=0;i<8;i++) {
				graphic_prio[i]=0;
				}
            }
    		return;

		case 0xF4:
    		for(uint16_t i=0;i<0x100;i++){
    			tcolor[i]=(tcolor[i]&0xF0)+(data & 0x07);
    		}
			return;

    }
 
    return;

}

static inline void memory_write(uint16_t address, uint8_t data)
{
	/* vram_enabled == 1 かつ address < 0xE000 */
    if (vram_enabled && address < 0xE000 && address >= 0xD000){
        vram[address & 0x0FFF] = data;
    	return;
    }

    /* address >= 0xC000 の場合のみGRAM書き込み */
    if (graphic_write_enable && address >= 0xC000){
        switch (graphic_write_plane){
        	case 0x01:
            	gvramb[address & 0x3FFF] = data;
            	break;
        	case 0x02:
            	gvramr[address & 0x3FFF] = data;
            	break;
        	case 0x03:
            	gvramg[address & 0x3FFF] = data;
            	break;
	        default:
    	    	break;
        }
    	return;
    }
    return;
}

void init_emulator(void) {

    // Erase Gamepad info

    kanjiptr=0;
    mz1r12ptr=0;
    mz1r18ptr=0;
    emmptr=0;
    tclptr=0;
    pcg_control=0;
    vram_enabled=0;
    pcg_enabled=0xff;
	pcg_bank=0;

	text40_mode=0;
	graphic_write_enable=0;
	graphic_write_plane=0;
	graphic_enable=0;
	graphic_plane_enable = 0x07;
	screen_bg_color = 0;

	for(int i=0;i<8;i++) {
        pallet[i]=i;
    }

    for(int i=0;i<8;i++) {
        gpallet[i]=i;
    }

    for(int i=0;i<8;i++) {
        graphic_prio[i]=0;
    }

    for(uint16_t i=0;i<0x2000;i++) {
        vram[i]=0;
    }

    for(uint16_t i=0;i<0x4000;i++) {
        gvramb[i]=0;
        gvramr[i]=0;
        gvramg[i]=0;
    }

// コピー前に割り込みを止める
	uint32_t ints = save_and_disable_interrupts();

	memcpy(cgram,fontrom,0x1000);

    // Load DUMMY data to MZ-1R12

    memcpy(mz1r12,romslots,0x8000);
//    memset(mz1r12,0xaa,0x8000);

    // Load EMM data to EMM

	memcpy(emm,emmslots,0x50000);

	restore_interrupts(ints);

	for(uint16_t offset=0;offset<0x100;offset++){
		tcolor[offset]=0x70;
	}

}

// Main thread (Core1)

void __not_in_flash_func(main_core1)(void) {

    volatile uint32_t bus;

    uint32_t control,address,data,response;
	uint32_t offset2;
	uint8_t value;

//    multicore_lockout_victim_init();

    gpio_init_mask(0xffffffff);
    gpio_set_dir_all_bits(0x00000000);  // All pins are INPUT
	gpio_init(32);
    gpio_set_dir(32,true);
    gpio_put(32,true);

// リセット用 GPIO25 を初期化＆割り込み
	gpio_init(RESET_PIN);
	gpio_set_dir(RESET_PIN,false);  // INPUT
	gpio_pull_up(RESET_PIN);        // 必要に応じてプルアップ
	gpio_set_irq_enabled_with_callback(RESET_PIN, GPIO_IRQ_EDGE_FALL, true, z80reset);	

	while(1) {

        bus=gpio_get_all();

        control=bus&0xf0000000;

        // Check IO Read

        if(control==0x50000000) {

        	gpio_put(32,false);
            address=(bus&0xffff00)>>8;

			offset2 = (kanjiptr << 1) | (address & 1);
			value = select_kanji ? kanjirom[offset2 & 0x1ffff] : jishorom[offset2 & 0x3fff];

        	switch(address&0xff) {

                // MZ-1R13
				case 0xb8:
					data = value;
                    response=1;
            		break;
				case 0xb9:
					data = value;
                    response=1;
					kanjiptr++;
            		break;
				case 0xba:
					data= ((value >> 7) & 0x01) | ((value >> 5) & 0x02) | ((value >> 3) & 0x04) | ((value >> 1) & 0x08) |
					       ((value << 1) & 0x10) | ((value << 3) & 0x20) | ((value << 5) & 0x40) | ((value << 7) & 0x80);
					response=1;
					break;
				case 0xbb:
					data= ((value >> 7) & 0x01) | ((value >> 5) & 0x02) | ((value >> 3) & 0x04) | ((value >> 1) & 0x08) |
					       ((value << 1) & 0x10) | ((value << 3) & 0x20) | ((value << 5) & 0x40) | ((value << 7) & 0x80);
					response=1;
					kanjiptr++;
            		break;


                // MZ-1R12

                case 0xf9:
                    data=mz1r12[mz1r12ptr&0x7fff];
                    response=1;
                    break;

                // EMM
                case 0xa7:
                    if(emmptr>0x4ffff) {
                        emmptr-=0x50000;
                    }
                    data=emm[emmptr++];
                    response=1;
                    break;

                default:
                    response=0;

            }

			gpio_put(32,true);
            if(response) {

                // Set GP0-7 to OUTPUT

                gpio_set_dir_masked(0xff,0xff);

                gpio_put_masked(0xff,data);

                // Wait while RD# is low

                control=0;

                while(control==0) {
                    bus=gpio_get_all();
                    control=bus&0x80000000;
                }

                // Set GP0-7 to INPUT

               gpio_set_dir_masked(0xff,0x00);
            	
            	

            } else {

                // Wait while RD# is low
                control=0;

                while(control==0) {
                    bus=gpio_get_all();
                    control=bus&0x80000000;
                }

            }

            continue;
        }

        // Check IO Write

        else if(control==0x90000000) {

        	gpio_put(32,false);

        	address=(bus&0xffff00)>>8;
            data=bus&0xff;

            io_write(address,data);

            control=0;

        	gpio_put(32,true);

        	// Wait while WR# is low
            while(control==0) {
                bus=gpio_get_all();
                control=bus&0x40000000;
            }

            continue;
        }
        
        // check Memory write

        else if(control==0xa0000000) {

        	address=(bus&0xffff00)>>8;
            data=bus&0xff;

            memory_write(address,data);

            control=0;

        	// Wait while WR# is low
            while(control==0) {
                bus=gpio_get_all();
                control=bus&0x40000000;
            }

        }

    }
}

int main() {

    uint32_t menuprint=0;
    uint32_t filelist=0;
    uint32_t subcpu_wait;
    uint32_t rampacno;
    uint32_t pacpage;

    static uint32_t hsync_wait,vsync_wait;

    vreg_set_voltage(VREG_VOLTAGE_1_20);  // for overclock to 200MHz
    set_sys_clock_khz(300000 ,true);

	gpio_put(RESET_PIN, 0);

	init_emulator();
    initVGA();
    multicore_launch_core1(main_core1);

	gpio_put(RESET_PIN, 1);
	
    irq_set_exclusive_handler (PIO0_IRQ_0, hsync_handler);
    irq_set_enabled(PIO0_IRQ_0, true);
    pio_set_irq0_source_enabled (pio0, pis_interrupt0 , true);

    // Set RESET# interrupt

//    gpio_set_irq_enabled_with_callback(RESET_PIN,GPIO_IRQ_EDGE_FALL,true,z80reset);
    gpio_set_irq_enabled_with_callback(RESET_PIN,GPIO_IRQ_EDGE_RISE,true,z80reset);

    while(1) {

        if(flash_command!=0) {

            switch(flash_command&0xf0000000) {

                case 0x10000000:  // SRAM load
                    memcpy(mz1r12,romslots+(flash_command&0x3f)*0x8000u,0x8000);
                    break;

                case 0x20000000:  // SRAM Save

                    for(uint32_t i=0;i<0x8000;i+=4096) {
                    uint32_t ints = save_and_disable_interrupts();
//                    multicore_lockout_start_blocking();     // pause another core
                    flash_range_erase(i+0x80000u+(flash_command&0x3f)*0x8000u, 4096);  
//                    multicore_lockout_end_blocking();
                    restore_interrupts(ints);
                    }

                    for(uint32_t i=0;i<0x8000;i+=4096) {
                    uint32_t ints = save_and_disable_interrupts();
//                    multicore_lockout_start_blocking();     // pause another core
                    flash_range_program(i+0x80000u+(flash_command&0x3f)*0x8000u, (const uint8_t *)(mz1r12+i), 4096);
//                    multicore_lockout_end_blocking();
                    restore_interrupts(ints);
                    }

                    break;

                case 0x30000000:  // EMM load
                    memcpy(emm,emmslots+(flash_command&0x1f)*0x50000u,0x50000);
                    break;                    

                case 0x40000000:  // EMM Save

                    for(uint32_t i=0;i<0x50000;i+=4096) {
                    uint32_t ints = save_and_disable_interrupts();
//                    multicore_lockout_start_blocking();     // pause another core
                    flash_range_erase(i+0x280000u+(flash_command&0x1f)*0x50000u, 4096);
//                    multicore_lockout_end_blocking();
                    restore_interrupts(ints);
                    }

                    for(uint32_t i=0;i<0x50000;i+=4096) {
                    uint32_t ints = save_and_disable_interrupts();
//                    multicore_lockout_start_blocking();     // pause another core
                    flash_range_program(i+0x280000u+(flash_command&0x1f)*0x50000u, (const uint8_t *)(emm+i), 4096);
//                    multicore_lockout_end_blocking();
                    restore_interrupts(ints);
                    }

                    break;  

            }
            flash_command=0;

        }
    }
}

