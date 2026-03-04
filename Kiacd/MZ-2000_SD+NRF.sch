EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 17717 11811
encoding utf-8
Sheet 1 1
Title "MZ-2000_SD+NRF"
Date ""
Rev "Rev1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x22_Row_Letter_First J1
U 1 1 627EE89C
P 2850 2700
F 0 "J1" H 2900 3850 50  0000 C CNN
F 1 "Conn_02x22_Row_Letter_First" H 2050 4450 50  0000 C CNN
F 2 "mz-2000:BUS_MZ2000" H 2850 2700 50  0001 C CNN
F 3 "~" H 2850 2700 50  0001 C CNN
	1    2850 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1800 2400 1800
Wire Wire Line
	2650 1900 2400 1900
Wire Wire Line
	2650 2000 2400 2000
Wire Wire Line
	3150 1800 3400 1800
Text Label 2450 1800 0    50   ~ 0
D2
Text Label 2450 1900 0    50   ~ 0
D1
Text Label 2450 2000 0    50   ~ 0
D0
Text Label 2450 2200 0    50   ~ 0
A15
Text Label 2450 2300 0    50   ~ 0
A14
Text Label 2450 2400 0    50   ~ 0
A13
Text Label 2450 2500 0    50   ~ 0
A12
Text Label 2450 2600 0    50   ~ 0
A11
Text Label 2450 2700 0    50   ~ 0
A10
Text Label 2450 2800 0    50   ~ 0
A9
Text Label 2450 2900 0    50   ~ 0
A8
Text Label 2450 3000 0    50   ~ 0
A7
Text Label 2450 3100 0    50   ~ 0
A6
Text Label 2450 3200 0    50   ~ 0
A5
Text Label 2450 3300 0    50   ~ 0
A4
Text Label 2450 3400 0    50   ~ 0
A3
Text Label 2450 3500 0    50   ~ 0
A2
Text Label 2450 3600 0    50   ~ 0
A1
Text Label 2450 3700 0    50   ~ 0
A0
Text Label 3150 3700 0    50   ~ 0
~MNI
Text Label 3150 3600 0    50   ~ 0
~EXWAIT
Text Label 3150 3500 0    50   ~ 0
~EXINT
Text Label 3150 3300 0    50   ~ 0
RESET
Text Label 3150 3200 0    50   ~ 0
IE0
Text Label 3150 3100 0    50   ~ 0
IE1
Text Label 3150 3000 0    50   ~ 0
~HALT
Text Label 3150 2800 0    50   ~ 0
~MREQ
Text Label 3150 2700 0    50   ~ 0
~IOREQ
Text Label 3150 2600 0    50   ~ 0
~RD
Text Label 3150 2500 0    50   ~ 0
~WR
Text Label 3150 2400 0    50   ~ 0
~M1
Text Label 3150 2300 0    50   ~ 0
phi
Text Label 3150 2200 0    50   ~ 0
D7
Text Label 3150 2100 0    50   ~ 0
D6
Text Label 3150 2000 0    50   ~ 0
D5
Text Label 3150 1900 0    50   ~ 0
D4
Text Label 3150 1800 0    50   ~ 0
D3
Wire Wire Line
	2650 2200 2400 2200
Wire Wire Line
	2650 2300 2400 2300
Wire Wire Line
	2650 2400 2400 2400
Wire Wire Line
	2650 2500 2400 2500
Wire Wire Line
	2650 2600 2400 2600
Wire Wire Line
	2650 2700 2400 2700
Wire Wire Line
	2650 2800 2400 2800
Wire Wire Line
	2650 2900 2400 2900
Wire Wire Line
	2650 3000 2400 3000
Wire Wire Line
	2650 3100 2400 3100
Wire Wire Line
	2650 3200 2400 3200
Wire Wire Line
	2650 3300 2400 3300
Wire Wire Line
	2650 3400 2400 3400
Wire Wire Line
	2650 3500 2400 3500
Wire Wire Line
	2650 3600 2400 3600
Wire Wire Line
	2650 3700 2400 3700
Wire Wire Line
	3150 1900 3400 1900
Wire Wire Line
	3150 2000 3400 2000
Wire Wire Line
	3150 2100 3400 2100
Wire Wire Line
	3150 2200 3400 2200
Wire Wire Line
	3150 2300 3400 2300
Wire Wire Line
	3150 2400 3400 2400
Wire Wire Line
	3150 2500 3400 2500
Wire Wire Line
	3150 2600 3400 2600
Wire Wire Line
	3150 2700 3400 2700
Wire Wire Line
	3150 2800 3400 2800
Wire Wire Line
	3150 3000 3400 3000
Wire Wire Line
	3150 3100 3400 3100
Wire Wire Line
	3150 3200 3400 3200
Wire Wire Line
	3150 3300 3400 3300
Wire Wire Line
	3150 3400 3400 3400
Wire Wire Line
	3150 3500 3400 3500
Wire Wire Line
	3150 3600 3400 3600
Wire Wire Line
	3150 3700 3400 3700
Text Label 3150 3400 0    50   ~ 0
~EXRESET
Wire Wire Line
	1150 3800 2450 3800
Wire Wire Line
	1150 2100 1150 3800
Wire Wire Line
	1150 2100 2650 2100
$Comp
L power:GND #PWR?
U 1 1 636B8114
P 2450 3950
AR Path="/6274F952/636B8114" Ref="#PWR?"  Part="1" 
AR Path="/636B8114" Ref="#PWR02"  Part="1" 
AR Path="/636550FF/636B8114" Ref="#PWR?"  Part="1" 
F 0 "#PWR02" H 2450 3700 50  0001 C CNN
F 1 "GND" H 2455 3777 50  0000 C CNN
F 2 "" H 2450 3950 50  0001 C CNN
F 3 "" H 2450 3950 50  0001 C CNN
	1    2450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3950 2450 3800
Connection ~ 2450 3800
Wire Wire Line
	2450 3800 2650 3800
Wire Wire Line
	2450 3950 3550 3950
Wire Wire Line
	3550 3950 3550 3800
Wire Wire Line
	3550 3800 3150 3800
Connection ~ 2450 3950
$Comp
L power:PWR_FLAG #FLG?
U 1 1 636B8121
P 2950 4200
AR Path="/636550FF/636B8121" Ref="#FLG?"  Part="1" 
AR Path="/636B8121" Ref="#FLG01"  Part="1" 
F 0 "#FLG01" H 2950 4275 50  0001 C CNN
F 1 "PWR_FLAG" H 2950 4373 50  0000 C CNN
F 2 "" H 2950 4200 50  0001 C CNN
F 3 "~" H 2950 4200 50  0001 C CNN
	1    2950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3950 3550 4300
Wire Wire Line
	3550 4300 2950 4300
Wire Wire Line
	2950 4300 2950 4200
Connection ~ 3550 3950
Wire Wire Line
	3150 2900 3550 2900
Wire Wire Line
	3550 2900 3550 3800
Connection ~ 3550 3800
$Comp
L power:+5V #PWR?
U 1 1 636B8140
P 2450 1300
AR Path="/6274F952/636B8140" Ref="#PWR?"  Part="1" 
AR Path="/636B8140" Ref="#PWR01"  Part="1" 
AR Path="/636550FF/636B8140" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 2450 1150 50  0001 C CNN
F 1 "+5V" H 2465 1473 50  0000 C CNN
F 2 "" H 2450 1300 50  0001 C CNN
F 3 "" H 2450 1300 50  0001 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1300 2450 1350
Wire Wire Line
	2450 1700 2650 1700
Wire Wire Line
	2450 1350 3400 1350
Wire Wire Line
	3400 1350 3400 1700
Connection ~ 2450 1350
Wire Wire Line
	2450 1350 2450 1700
$Comp
L power:PWR_FLAG #FLG?
U 1 1 636B814C
P 3400 1300
AR Path="/636550FF/636B814C" Ref="#FLG?"  Part="1" 
AR Path="/636B814C" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 3400 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 3400 1473 50  0000 C CNN
F 2 "" H 3400 1300 50  0001 C CNN
F 3 "~" H 3400 1300 50  0001 C CNN
	1    3400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1300 3400 1350
Connection ~ 3400 1350
$Comp
L Device:CP C?
U 1 1 636B8154
P 1850 2550
AR Path="/636550FF/636B8154" Ref="C?"  Part="1" 
AR Path="/636B8154" Ref="C4"  Part="1" 
F 0 "C4" H 1700 2750 50  0000 L CNN
F 1 "100uF" H 1850 2750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1888 2400 50  0001 C CNN
F 3 "~" H 1850 2550 50  0001 C CNN
	1    1850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2400 1850 1350
Wire Wire Line
	1850 1350 2450 1350
Wire Wire Line
	1850 2700 1850 3950
Wire Wire Line
	1850 3950 2450 3950
Text Label 2450 1700 0    50   ~ 0
+5V
Text Label 2500 2100 0    50   ~ 0
GND
Text Label 2500 3800 0    50   ~ 0
GND
Text Label 3150 1700 0    50   ~ 0
+5V
Text Label 3150 2900 0    50   ~ 0
GND
Text Label 3150 3800 0    50   ~ 0
GND
Wire Wire Line
	3150 1700 3400 1700
NoConn ~ 3400 3100
NoConn ~ 3400 3000
NoConn ~ 3400 3200
NoConn ~ 3400 3400
NoConn ~ 3400 3500
NoConn ~ 3400 3700
NoConn ~ 3400 2300
NoConn ~ 3400 2400
Wire Wire Line
	2700 9450 2700 10000
Wire Wire Line
	2700 10000 3250 10000
Wire Wire Line
	2700 8800 3250 8800
Wire Wire Line
	2700 9150 2700 8800
$Comp
L Device:C C?
U 1 1 66451569
P 2700 9300
AR Path="/6274F952/66451569" Ref="C?"  Part="1" 
AR Path="/66451569" Ref="C1"  Part="1" 
AR Path="/636550FF/66451569" Ref="C?"  Part="1" 
F 0 "C1" H 2815 9346 50  0000 L CNN
F 1 "0.1uF" H 2815 9255 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2738 9150 50  0001 C CNN
F 3 "~" H 2700 9300 50  0001 C CNN
	1    2700 9300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6638C09B
P 3250 8800
AR Path="/6274F952/6638C09B" Ref="#PWR?"  Part="1" 
AR Path="/6638C09B" Ref="#PWR022"  Part="1" 
AR Path="/636550FF/6638C09B" Ref="#PWR?"  Part="1" 
F 0 "#PWR022" H 3250 8650 50  0001 C CNN
F 1 "+5V" H 3265 8973 50  0000 C CNN
F 2 "" H 3250 8800 50  0001 C CNN
F 3 "" H 3250 8800 50  0001 C CNN
	1    3250 8800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 66323DEB
P 3250 10000
AR Path="/6274F952/66323DEB" Ref="#PWR?"  Part="1" 
AR Path="/66323DEB" Ref="#PWR023"  Part="1" 
AR Path="/636550FF/66323DEB" Ref="#PWR?"  Part="1" 
F 0 "#PWR023" H 3250 9750 50  0001 C CNN
F 1 "GND" H 3255 9827 50  0000 C CNN
F 2 "" H 3250 10000 50  0001 C CNN
F 3 "" H 3250 10000 50  0001 C CNN
	1    3250 10000
	1    0    0    -1  
$EndComp
Connection ~ 3250 10000
Wire Wire Line
	3250 9900 3250 10000
Connection ~ 3250 8800
Wire Wire Line
	3250 8900 3250 8800
$Comp
L 74xx:74LS04 U1
U 7 1 66078E53
P 3250 9400
F 0 "U1" H 3480 9446 50  0000 L CNN
F 1 "74LS04" H 3480 9355 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3250 9400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3250 9400 50  0001 C CNN
	7    3250 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2100 8100 2100
Wire Wire Line
	8250 2500 8250 2400
Wire Wire Line
	7950 2500 8250 2500
Wire Wire Line
	7950 2100 7950 2500
$Comp
L power:+5V #PWR?
U 1 1 638B9108
P 8250 2400
AR Path="/636550FF/638B9108" Ref="#PWR?"  Part="1" 
AR Path="/638B9108" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8250 2250 50  0001 C CNN
F 1 "+5V" H 8265 2573 50  0000 C CNN
F 2 "" H 8250 2400 50  0001 C CNN
F 3 "" H 8250 2400 50  0001 C CNN
	1    8250 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3150 7300 3150
Wire Wire Line
	7750 1800 7750 3150
Wire Wire Line
	7700 2600 7300 2600
Wire Wire Line
	7700 1700 7700 2600
Wire Wire Line
	7400 1500 8100 1500
Wire Wire Line
	7400 1800 7400 1500
Wire Wire Line
	7300 1800 7400 1800
Wire Wire Line
	6450 2150 7650 2150
Wire Wire Line
	6450 1400 8100 1400
Text Label 6450 3700 0    50   ~ 0
A2
Wire Wire Line
	6700 3700 6450 3700
Wire Wire Line
	3250 10000 3950 10000
Wire Wire Line
	3250 8800 3950 8800
Wire Wire Line
	8700 1700 10450 1700
Text Label 9400 4450 0    50   ~ 0
RESET
Wire Wire Line
	9350 2300 10450 2300
Wire Wire Line
	9350 2200 10450 2200
Text Label 9400 1800 0    50   ~ 0
~RD
Text Label 9400 1900 0    50   ~ 0
~WR
Text Label 9400 2300 0    50   ~ 0
A1
Text Label 9400 2200 0    50   ~ 0
A0
Wire Wire Line
	9350 2600 10450 2600
Wire Wire Line
	9350 2700 10450 2700
Wire Wire Line
	9350 2800 10450 2800
Text Label 9400 2600 0    50   ~ 0
D0
Text Label 9400 2700 0    50   ~ 0
D1
Text Label 9400 2800 0    50   ~ 0
D2
Wire Wire Line
	9350 3300 10450 3300
Wire Wire Line
	9350 3200 10450 3200
Wire Wire Line
	9350 3100 10450 3100
Wire Wire Line
	9350 3000 10450 3000
Wire Wire Line
	9350 2900 10450 2900
Text Label 9400 2900 0    50   ~ 0
D3
Text Label 9400 3000 0    50   ~ 0
D4
Text Label 9400 3100 0    50   ~ 0
D5
Text Label 9400 3200 0    50   ~ 0
D6
Text Label 9400 3300 0    50   ~ 0
D7
Wire Wire Line
	11850 2600 12350 2600
Wire Wire Line
	11850 2700 12350 2700
Wire Wire Line
	11850 2800 12350 2800
Text Label 6450 3150 0    50   ~ 0
A3
Text Label 6450 2600 0    50   ~ 0
A4
Text Label 6450 2150 0    50   ~ 0
A5
Text Label 6450 1800 0    50   ~ 0
A6
Text Label 6450 1400 0    50   ~ 0
A7
Wire Wire Line
	6450 3150 6700 3150
Wire Wire Line
	6450 2600 6700 2600
Wire Wire Line
	6450 1800 6700 1800
Wire Wire Line
	8100 2000 7850 2000
Wire Wire Line
	7800 1900 7800 3700
Wire Wire Line
	8100 1900 7800 1900
Wire Wire Line
	8100 1800 7750 1800
Wire Wire Line
	8100 1700 7700 1700
Wire Wire Line
	7650 1600 8100 1600
Wire Wire Line
	7650 2150 7650 1600
$Comp
L 74xx:74LS04 U?
U 5 1 636B826E
P 7000 4250
AR Path="/636550FF/636B826E" Ref="U?"  Part="5" 
AR Path="/636B826E" Ref="U1"  Part="5" 
F 0 "U1" H 7000 4567 50  0000 C CNN
F 1 "74LS04" H 7000 4476 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 4250 50  0001 C CNN
	5    7000 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 4 1 636B8268
P 7000 3700
AR Path="/636550FF/636B8268" Ref="U?"  Part="4" 
AR Path="/636B8268" Ref="U1"  Part="4" 
F 0 "U1" H 7000 4017 50  0000 C CNN
F 1 "74LS04" H 7000 3926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 3700 50  0001 C CNN
	4    7000 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12250 5750 12250 2100
Wire Wire Line
	11500 5750 12250 5750
Wire Wire Line
	10250 5750 10900 5750
Wire Wire Line
	10250 4450 10250 5750
$Comp
L 74xx:74LS04 U?
U 3 1 636B825D
P 7000 3150
AR Path="/636550FF/636B825D" Ref="U?"  Part="3" 
AR Path="/636B825D" Ref="U1"  Part="3" 
F 0 "U1" H 7000 3467 50  0000 C CNN
F 1 "74LS04" H 7000 3376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 3150 50  0001 C CNN
	3    7000 3150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 636B8257
P 7000 2600
AR Path="/636550FF/636B8257" Ref="U?"  Part="2" 
AR Path="/636B8257" Ref="U1"  Part="2" 
F 0 "U1" H 7000 2917 50  0000 C CNN
F 1 "74LS04" H 7000 2826 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 2600 50  0001 C CNN
	2    7000 2600
	1    0    0    -1  
$EndComp
Text Label 6450 4250 0    50   ~ 0
~IOREQ
Wire Wire Line
	6450 4250 6700 4250
$Comp
L 74xx:74LS30 U?
U 1 1 636B81C6
P 8400 1700
AR Path="/636550FF/636B81C6" Ref="U?"  Part="1" 
AR Path="/636B81C6" Ref="U2"  Part="1" 
F 0 "U2" H 8400 2225 50  0000 C CNN
F 1 "74LS30" H 8400 2134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8400 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 8400 1700 50  0001 C CNN
	1    8400 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 1 1 636B81BB
P 7000 1800
AR Path="/636550FF/636B81BB" Ref="U?"  Part="1" 
AR Path="/636B81BB" Ref="U1"  Part="1" 
F 0 "U1" H 7000 2117 50  0000 C CNN
F 1 "74LS04" H 7000 2026 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7000 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 1800 50  0001 C CNN
	1    7000 1800
	1    0    0    -1  
$EndComp
Text Label 14800 4150 0    50   ~ 0
CS
Text Label 14800 4050 0    50   ~ 0
SCK
Text Label 14800 3950 0    50   ~ 0
MOSI
Text Label 14800 3850 0    50   ~ 0
MISO
Text Label 14800 3750 0    50   ~ 0
+5V
Text Label 14800 3650 0    50   ~ 0
GND
Wire Wire Line
	15000 4150 14800 4150
Wire Wire Line
	15000 4050 14800 4050
Wire Wire Line
	15000 3950 14800 3950
Wire Wire Line
	15000 3850 14800 3850
Wire Wire Line
	15000 3750 14800 3750
Wire Wire Line
	15000 3650 14800 3650
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 636B81A9
P 15200 3850
AR Path="/636550FF/636B81A9" Ref="J?"  Part="1" 
AR Path="/636B81A9" Ref="J6"  Part="1" 
F 0 "J6" H 15280 3842 50  0000 L CNN
F 1 "MicroSD Card Adapter" H 14800 3350 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 15200 3850 50  0001 C CNN
F 3 "~" H 15200 3850 50  0001 C CNN
	1    15200 3850
	1    0    0    -1  
$EndComp
Text Label 14100 3000 0    50   ~ 0
CS
Text Label 14100 2900 0    50   ~ 0
MOSI
Text Label 14100 2800 0    50   ~ 0
MISO
Text Label 14100 2700 0    50   ~ 0
SCK
Wire Wire Line
	12250 2100 12350 2100
Wire Wire Line
	9350 4450 10250 4450
$Comp
L Memory_RAM2:Micro_SD_Card_Kit J?
U 1 1 636B7FC6
P 15200 2600
AR Path="/636550FF/636B7FC6" Ref="J?"  Part="1" 
AR Path="/636B7FC6" Ref="J5"  Part="1" 
F 0 "J5" H 16030 2596 50  0000 L CNN
F 1 "Micro_SD_Card_Kit" H 16030 2505 50  0000 L CNN
F 2 "MZ-2000_SD_3_2:AE-microSD-LLCNV" H 16350 2900 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 15200 2600 50  0001 C CNN
	1    15200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 2200 13750 1900
Wire Wire Line
	13550 2200 13750 2200
NoConn ~ 12350 1900
NoConn ~ 12350 2000
NoConn ~ 12350 2200
NoConn ~ 12850 3400
NoConn ~ 12950 3400
NoConn ~ 13550 2100
NoConn ~ 13550 1900
Wire Wire Line
	14150 2600 14150 3250
Wire Wire Line
	14300 2600 14150 2600
$Comp
L power:GND #PWR?
U 1 1 636B7FB5
P 14150 3250
AR Path="/636550FF/636B7FB5" Ref="#PWR?"  Part="1" 
AR Path="/636B7FB5" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 14150 3000 50  0001 C CNN
F 1 "GND" H 14155 3077 50  0000 C CNN
F 2 "" H 14150 3250 50  0001 C CNN
F 3 "" H 14150 3250 50  0001 C CNN
	1    14150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 2300 14300 2300
Wire Wire Line
	14150 2150 14150 2300
$Comp
L power:+5V #PWR?
U 1 1 636B7FAD
P 14150 2150
AR Path="/636550FF/636B7FAD" Ref="#PWR?"  Part="1" 
AR Path="/636B7FAD" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 14150 2000 50  0001 C CNN
F 1 "+5V" H 14165 2323 50  0000 C CNN
F 2 "" H 14150 2150 50  0001 C CNN
F 3 "" H 14150 2150 50  0001 C CNN
	1    14150 2150
	1    0    0    -1  
$EndComp
NoConn ~ 14300 3100
NoConn ~ 14300 2500
NoConn ~ 14300 2400
Wire Wire Line
	13550 3000 14300 3000
Wire Wire Line
	13550 2900 14300 2900
Wire Wire Line
	13550 2800 14300 2800
Wire Wire Line
	13550 2700 14300 2700
NoConn ~ 11850 3800
NoConn ~ 11850 3700
NoConn ~ 11850 3600
NoConn ~ 11850 3500
NoConn ~ 11850 3300
NoConn ~ 11850 3200
NoConn ~ 11850 2100
NoConn ~ 11850 2000
NoConn ~ 11850 1900
NoConn ~ 11850 1800
$Comp
L power:+5V #PWR?
U 1 1 636B7F96
P 13750 1900
AR Path="/636550FF/636B7F96" Ref="#PWR?"  Part="1" 
AR Path="/636B7F96" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 13750 1750 50  0001 C CNN
F 1 "+5V" H 13765 2073 50  0000 C CNN
F 2 "" H 13750 1900 50  0001 C CNN
F 3 "" H 13750 1900 50  0001 C CNN
	1    13750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 2000 13650 3200
Wire Wire Line
	13550 2000 13650 2000
$Comp
L power:GND #PWR?
U 1 1 636B7F8E
P 13650 3200
AR Path="/636550FF/636B7F8E" Ref="#PWR?"  Part="1" 
AR Path="/636B7F8E" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 13650 2950 50  0001 C CNN
F 1 "GND" H 13655 3027 50  0000 C CNN
F 2 "" H 13650 3200 50  0001 C CNN
F 3 "" H 13650 3200 50  0001 C CNN
	1    13650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 3600 13150 3400
Wire Wire Line
	12100 3600 13150 3600
Wire Wire Line
	12100 1700 12100 3600
Wire Wire Line
	11850 1700 12100 1700
Wire Wire Line
	13050 3500 13050 3400
Wire Wire Line
	12150 3500 13050 3500
Wire Wire Line
	12150 1600 12150 3500
Wire Wire Line
	11850 1600 12150 1600
Wire Wire Line
	13900 2300 13550 2300
Wire Wire Line
	13900 1500 13900 2300
Wire Wire Line
	11850 1500 13900 1500
Wire Wire Line
	14000 2400 13550 2400
Wire Wire Line
	14000 1400 14000 2400
Wire Wire Line
	11850 1400 14000 1400
Wire Wire Line
	14000 2500 13550 2500
Wire Wire Line
	14000 4000 14000 2500
Wire Wire Line
	12000 4000 14000 4000
Wire Wire Line
	12000 3400 12000 4000
Wire Wire Line
	11850 3400 12000 3400
Wire Wire Line
	13900 2600 13550 2600
Wire Wire Line
	13900 3900 13900 2600
Wire Wire Line
	11850 3900 13900 3900
Wire Wire Line
	11850 2300 12350 2300
Wire Wire Line
	11850 2400 12350 2400
Wire Wire Line
	11850 2500 12350 2500
Wire Wire Line
	11850 2900 12350 2900
Wire Wire Line
	11850 3000 12350 3000
$Comp
L power:+5V #PWR?
U 1 1 636B7F69
P 11150 1100
AR Path="/636550FF/636B7F69" Ref="#PWR?"  Part="1" 
AR Path="/636B7F69" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 11150 950 50  0001 C CNN
F 1 "+5V" H 11165 1273 50  0000 C CNN
F 2 "" H 11150 1100 50  0001 C CNN
F 3 "" H 11150 1100 50  0001 C CNN
	1    11150 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 1100 11150 1100
Wire Wire Line
	10400 4350 10400 1100
Wire Wire Line
	10500 4350 10400 4350
Wire Wire Line
	11150 4300 11150 4350
Wire Wire Line
	11150 4350 11150 4400
Connection ~ 11150 4350
Wire Wire Line
	10800 4350 11150 4350
$Comp
L power:GND #PWR?
U 1 1 636B7F5C
P 11150 4400
AR Path="/636550FF/636B7F5C" Ref="#PWR?"  Part="1" 
AR Path="/636B7F5C" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 11150 4150 50  0001 C CNN
F 1 "GND" H 11155 4227 50  0000 C CNN
F 2 "" H 11150 4400 50  0001 C CNN
F 3 "" H 11150 4400 50  0001 C CNN
	1    11150 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 636B7F56
P 10650 4350
AR Path="/636550FF/636B7F56" Ref="C?"  Part="1" 
AR Path="/636B7F56" Ref="C3"  Part="1" 
F 0 "C3" V 10500 4450 50  0000 C CNN
F 1 "0.1uF" V 10500 4200 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 10688 4200 50  0001 C CNN
F 3 "~" H 10650 4350 50  0001 C CNN
	1    10650 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9350 1800 10450 1800
Wire Wire Line
	9350 1900 10450 1900
Connection ~ 11150 1100
Wire Wire Line
	10250 1400 10450 1400
Connection ~ 10250 4450
Wire Wire Line
	10250 4450 10250 1400
Wire Wire Line
	7300 3700 7800 3700
Wire Wire Line
	7850 2000 7850 4250
Wire Wire Line
	7300 4250 7850 4250
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 697BB077
P 2700 6200
AR Path="/697AC97A/697BB077" Ref="J?"  Part="1" 
AR Path="/697BB077" Ref="J2"  Part="1" 
F 0 "J2" H 2750 7117 50  0000 C CNN
F 1 "RP2350B Left" H 2750 7026 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 2700 6200 50  0001 C CNN
F 3 "~" H 2700 6200 50  0001 C CNN
	1    2700 6200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x15_Top_Bottom J?
U 1 1 697BB07D
P 5600 6250
AR Path="/697AC97A/697BB07D" Ref="J?"  Part="1" 
AR Path="/697BB07D" Ref="J3"  Part="1" 
F 0 "J3" H 5650 7167 50  0000 C CNN
F 1 "RP2350B Right" H 5650 7076 50  0000 C CNN
F 2 "MZ-1500:PinHeader_2x15_P2.54mm_Vertical" H 5600 6250 50  0001 C CNN
F 3 "~" H 5600 6250 50  0001 C CNN
	1    5600 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 697BB083
P 7500 5850
AR Path="/697AC97A/697BB083" Ref="R?"  Part="1" 
AR Path="/697BB083" Ref="R1"  Part="1" 
F 0 "R1" V 7293 5850 50  0000 C CNN
F 1 "330" V 7384 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 5850 50  0001 C CNN
F 3 "~" H 7500 5850 50  0001 C CNN
	1    7500 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 697BB089
P 7500 6250
AR Path="/697AC97A/697BB089" Ref="R?"  Part="1" 
AR Path="/697BB089" Ref="R2"  Part="1" 
F 0 "R2" V 7293 6250 50  0000 C CNN
F 1 "330" V 7384 6250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 6250 50  0001 C CNN
F 3 "~" H 7500 6250 50  0001 C CNN
	1    7500 6250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 697BB08F
P 7500 6650
AR Path="/697AC97A/697BB08F" Ref="R?"  Part="1" 
AR Path="/697BB08F" Ref="R3"  Part="1" 
F 0 "R3" V 7293 6650 50  0000 C CNN
F 1 "330" V 7384 6650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 6650 50  0001 C CNN
F 3 "~" H 7500 6650 50  0001 C CNN
	1    7500 6650
	0    1    1    0   
$EndComp
$Comp
L Connector:DB15_Female_HighDensity J?
U 1 1 697BB095
P 8600 6250
AR Path="/697AC97A/697BB095" Ref="J?"  Part="1" 
AR Path="/697BB095" Ref="J4"  Part="1" 
F 0 "J4" H 8600 7117 50  0000 C CNN
F 1 "VGA" H 8600 7026 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-15-HD_Female_Horizontal_P2.29x1.98mm_EdgePinOffset3.03mm_Housed_MountingHolesOffset4.94mm" H 7650 6650 50  0001 C CNN
F 3 " ~" H 7650 6650 50  0001 C CNN
	1    8600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5500 2100 5500
Text Label 2100 5500 0    50   ~ 0
+5V
Text Label 2100 5900 0    50   ~ 0
D3
Text Label 2100 6000 0    50   ~ 0
D5
Text Label 2100 6100 0    50   ~ 0
D7
Wire Wire Line
	2100 5900 2500 5900
Wire Wire Line
	2100 6000 2500 6000
Wire Wire Line
	2100 6100 2500 6100
Wire Wire Line
	3400 5900 3000 5900
Wire Wire Line
	3400 6000 3000 6000
Text Label 3400 5900 2    50   ~ 0
D4
Text Label 3400 6000 2    50   ~ 0
D6
Text Label 2100 5800 0    50   ~ 0
D1
Text Label 3400 5700 2    50   ~ 0
D0
Text Label 3400 5800 2    50   ~ 0
D2
Wire Wire Line
	3000 5800 3400 5800
Wire Wire Line
	3000 5700 3400 5700
Wire Wire Line
	2100 5800 2500 5800
Text Label 2100 6600 0    50   ~ 0
A9
Text Label 2100 6700 0    50   ~ 0
A11
Text Label 2100 6500 0    50   ~ 0
A7
Text Label 3400 6700 2    50   ~ 0
A12
Text Label 3400 6800 2    50   ~ 0
A14
Text Label 2100 6200 0    50   ~ 0
A1
Text Label 2100 6300 0    50   ~ 0
A3
Text Label 2100 6400 0    50   ~ 0
A5
Text Label 3400 6600 2    50   ~ 0
A10
Text Label 3400 6400 2    50   ~ 0
A6
Text Label 3400 6500 2    50   ~ 0
A8
Text Label 2100 6800 0    50   ~ 0
A13
Text Label 3400 6100 2    50   ~ 0
A0
Text Label 3400 6200 2    50   ~ 0
A2
Text Label 3400 6300 2    50   ~ 0
A4
Text Label 2100 6900 0    50   ~ 0
A15
Wire Wire Line
	3000 6100 3400 6100
Wire Wire Line
	3000 6200 3400 6200
Wire Wire Line
	3000 6300 3400 6300
Wire Wire Line
	3000 6400 3400 6400
Wire Wire Line
	3000 6500 3400 6500
Wire Wire Line
	3000 6600 3400 6600
Wire Wire Line
	3000 6700 3400 6700
Wire Wire Line
	3000 6800 3400 6800
Wire Wire Line
	2100 6200 2500 6200
Wire Wire Line
	2100 6300 2500 6300
Wire Wire Line
	2100 6400 2500 6400
Wire Wire Line
	2100 6500 2500 6500
Wire Wire Line
	2100 6600 2500 6600
Wire Wire Line
	2100 6700 2500 6700
Wire Wire Line
	2100 6800 2500 6800
Wire Wire Line
	2100 6900 2500 6900
NoConn ~ 3000 6900
NoConn ~ 2500 5600
NoConn ~ 2500 5700
NoConn ~ 3000 5500
NoConn ~ 3000 5600
NoConn ~ 5400 5550
NoConn ~ 5400 5650
NoConn ~ 5400 5750
NoConn ~ 5400 5850
NoConn ~ 5400 5950
NoConn ~ 5400 6050
NoConn ~ 5400 6150
NoConn ~ 5400 6250
NoConn ~ 5400 6850
NoConn ~ 5900 5650
NoConn ~ 5900 5750
NoConn ~ 5900 5850
NoConn ~ 5900 5950
NoConn ~ 5900 6050
NoConn ~ 5900 6150
NoConn ~ 5900 6250
NoConn ~ 5900 6350
NoConn ~ 5900 6950
Wire Wire Line
	5000 6650 5400 6650
Text Label 5000 6650 0    50   ~ 0
~RD
Text Label 5000 6750 0    50   ~ 0
~IOREQ
Wire Wire Line
	5000 6750 5400 6750
Text Label 5000 6950 0    50   ~ 0
RESET
Wire Wire Line
	5000 6950 5400 6950
Text Label 6300 6650 2    50   ~ 0
~EXWAIT
Wire Wire Line
	6300 6650 5900 6650
Text Label 6300 6750 2    50   ~ 0
~WR
Wire Wire Line
	6300 6750 5900 6750
Text Label 6300 6850 2    50   ~ 0
~MREQ
Wire Wire Line
	6300 6850 5900 6850
Wire Wire Line
	5900 6450 6750 6450
Wire Wire Line
	6750 6450 6750 5850
Wire Wire Line
	6750 5850 7350 5850
Wire Wire Line
	7650 5850 8300 5850
Wire Wire Line
	7650 6250 8300 6250
Wire Wire Line
	7350 6250 6850 6250
Wire Wire Line
	6850 6250 6850 7500
Wire Wire Line
	6850 7500 4550 7500
Wire Wire Line
	4550 7500 4550 6450
Wire Wire Line
	4550 6450 5400 6450
Wire Wire Line
	7650 6650 7750 6650
Wire Wire Line
	7750 6650 7750 6050
Wire Wire Line
	7750 6050 8300 6050
Wire Wire Line
	7350 6650 6950 6650
Wire Wire Line
	6950 6650 6950 7600
Wire Wire Line
	6950 7600 4450 7600
Wire Wire Line
	4450 7600 4450 6350
Wire Wire Line
	4450 6350 5400 6350
Wire Wire Line
	5400 6550 4650 6550
Wire Wire Line
	4650 6550 4650 7700
Wire Wire Line
	4650 7700 9200 7700
Wire Wire Line
	9200 7700 9200 6250
Wire Wire Line
	9200 6250 8900 6250
Wire Wire Line
	5900 6550 6750 6550
Wire Wire Line
	6750 6550 6750 7400
Wire Wire Line
	6750 7400 9100 7400
Wire Wire Line
	9100 7400 9100 6450
Wire Wire Line
	9100 6450 8900 6450
Wire Wire Line
	8300 5750 8100 5750
Wire Wire Line
	8100 5750 8100 5950
Wire Wire Line
	8100 5950 8300 5950
Wire Wire Line
	8100 5950 8100 6150
Wire Wire Line
	8100 6150 8300 6150
Connection ~ 8100 5950
Wire Wire Line
	8100 6150 8100 6550
Wire Wire Line
	8100 6550 8300 6550
Connection ~ 8100 6150
NoConn ~ 8900 5850
NoConn ~ 8900 6050
NoConn ~ 8900 6650
NoConn ~ 8300 6350
NoConn ~ 8300 6450
NoConn ~ 8300 6650
Wire Wire Line
	5900 5550 6300 5550
Wire Wire Line
	6300 5550 6300 5900
$Comp
L power:GND #PWR?
U 1 1 697BB11D
P 6300 5900
AR Path="/697AC97A/697BB11D" Ref="#PWR?"  Part="1" 
AR Path="/697BB11D" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 6300 5650 50  0001 C CNN
F 1 "GND" H 6305 5727 50  0000 C CNN
F 2 "" H 6300 5900 50  0001 C CNN
F 3 "" H 6300 5900 50  0001 C CNN
	1    6300 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 697BB123
P 8100 6700
AR Path="/697AC97A/697BB123" Ref="#PWR?"  Part="1" 
AR Path="/697BB123" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 8100 6450 50  0001 C CNN
F 1 "GND" H 8105 6527 50  0000 C CNN
F 2 "" H 8100 6700 50  0001 C CNN
F 3 "" H 8100 6700 50  0001 C CNN
	1    8100 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 6700 8100 6550
Connection ~ 8100 6550
$Comp
L 74xx:74LS04 U1
U 6 1 698F1723
P 11200 5750
F 0 "U1" H 11200 6067 50  0000 C CNN
F 1 "74LS04" H 11200 5976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 11200 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 11200 5750 50  0001 C CNN
	6    11200 5750
	1    0    0    -1  
$EndComp
$Comp
L Arduino:Arduino_Pro_Mini U?
U 1 1 636B7F46
P 12950 2500
AR Path="/636550FF/636B7F46" Ref="U?"  Part="1" 
AR Path="/636B7F46" Ref="U4"  Part="1" 
F 0 "U4" H 12950 3389 60  0000 C CNN
F 1 "Arduino_Pro_Mini_5V" H 12950 3283 60  0000 C CNN
F 2 "MZ-2000_SD_3_2:Arduino_Pro_Mini" H 13750 1750 60  0001 C CNN
F 3 "https://www.sparkfun.com/products/11113" H 13150 1300 60  0001 C CNN
	1    12950 2500
	1    0    0    -1  
$EndComp
$Comp
L Interface:8255 U?
U 1 1 636B7F4E
P 11150 2700
AR Path="/636550FF/636B7F4E" Ref="U?"  Part="1" 
AR Path="/636B7F4E" Ref="U3"  Part="1" 
F 0 "U3" H 10750 4200 50  0000 C CNN
F 1 "8255" H 11550 4200 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 11150 3000 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 11150 3000 50  0001 C CNN
	1    11150 2700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U2
U 2 1 6607FD78
P 4500 9400
F 0 "U2" H 4730 9446 50  0000 L CNN
F 1 "74LS30" H 4730 9355 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 9400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 4500 9400 50  0001 C CNN
	2    4500 9400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 8800 4500 8900
Wire Wire Line
	4500 10000 4500 9900
$Comp
L Device:C C?
U 1 1 666D8858
P 3950 9250
AR Path="/6274F952/666D8858" Ref="C?"  Part="1" 
AR Path="/666D8858" Ref="C2"  Part="1" 
AR Path="/636550FF/666D8858" Ref="C?"  Part="1" 
F 0 "C2" H 4065 9296 50  0000 L CNN
F 1 "0.1uF" H 4065 9205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3988 9100 50  0001 C CNN
F 3 "~" H 3950 9250 50  0001 C CNN
	1    3950 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 9400 3950 10000
Wire Wire Line
	3950 10000 4500 10000
Wire Wire Line
	3950 9100 3950 8800
Wire Wire Line
	3950 8800 4500 8800
Connection ~ 3950 8800
Connection ~ 3950 10000
$EndSCHEMATC
