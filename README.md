# MZ-2000_SD+偽RAMFILE複合ボード

![MZ-2000_SD](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/JPEG/TITLE.JPG)

しっぽいいんちょさんが作られた「偽RAMFILE for MZ-1500」を元にしてMZ-2000_SDと合体させたボードです。

以下の機能があります。

・MZ-2000_SDの起動及びMZ-2000_SDの機能

・MZ-2000のテキスト出力及びグラフィック出力をエミュレートしてVGA出力

・EMM1エミュレータ

・漢字ROMボードエミュレータ

・VGA出力される出力をI/Oポートの操作により機能強化(主にテキスト関連)

　　・キャラクタ単位でFONTの差し替え

　　・FONTキャラクタごとの色(前景色)及び背景色の指定

　　・すべてのキャラクタを1Dot単位で色指定可能なPCG

　　・FONTとPCGのプライオリティ設定

　　・テキストの色パレット機能

　　・グラフィックの色パレット機能

　　・テキストとグラフィックを色ごとにプライオリティ設定

MZ-2000_SD: https://github.com/yanataka60/MZ-1500_SD

## 回路図
　KiCadフォルダ内のMZ-2000_SD+NRF.pdfを参照してください。

[回路図](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/Kicad/MZ-1500_SD%2BNRF.pdf)

![MZ-2000_SD](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/Kicad/MZ-1500_SD%2BNRF.jpg)

|番号|品名|数量|備考|
| ------------ | ------------ | ------------ | ------------ |
|J2,J3|ピンソケット2x15Pin|2|RP2350Bマイコンボード用,秋月電子通商 FHU-2x42SGなど|
|J4|VGA用基板ソケット 3列15ピン|1|マルツ DJ-VGA14.5など|
||J5、J6のいずれか|||
|J5|Micro_SD_Card_Kit|1|秋月電子通商 AE-microSD-LLCNV (注1)|
|J6|MicroSD Card Adapter|1|Arduino等に使われる5V電源に対応したもの(注3)|
|U1|74LS04|1||
|U2|74LS30|1||
|U3|8255|1||
|U4|Arduino_Pro_Mini_5V|1|Atmega328版を使用 168版は不可。(注2)|
||RP2350Bボード(Raspberry Pi Pico 2)|1|Amazon WA00021 RP2350Bマイコンボードなど|
|C1-C3|積層セラミックコンデンサ 0.1uF|3||
|C4|電解コンデンサ 16v100uF|1||
|R1-R3|カーボン抵抗 330Ω|3||
||ピンヘッダ|2Pin分|Arduino_Pro_MiniにはA4、A5用のピンヘッダが付いていないため別途調達が必要です 秋月電子通商 PH-1x40SGなど|
||ピンソケット(任意)|26Pin分|Arduino_Pro_Miniを取り外し可能としたい場合に調達します 秋月電子通商 FHU-1x42SGなど|

　　　注1)秋月電子通商　AE-microSD-LLCNVのJ1ジャンパはショートしてください。

　　　注2)Arduino Pro MiniはA4、A5ピンも使っています。

　　　注3)MicroSD Card Adapterを使う場合

　　　　　J6に取り付けます。

MicroSD Card Adapterについているピンヘッダを除去してハンダ付けするのが一番確実ですが、J6の穴にMicroSD Card Adapterをぴったりと押しつけ、裏から多めにハンダを流し込むことでハンダ付けをする方法もあります。なお、この方法の時にはしっかりハンダ付けが出来たかテスターで導通を確認しておいた方が安心です。

ハンダ付けに自信のない方はJ5の秋月電子通商　AE-microSD-LLCNVをお使いください。AE-microSD-LLCNVならパワーLED、アクセスLEDが付いています。

![MicroSD Card Adapter1](https://github.com/yanataka60/MZ-1500_SD-NiseRamFile/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

## 偽RAMFILE for MZ-2000の書込み
　RP2350Bフォルダにあるniseramfile.uf2をRP2350Bマイコンボードに書き込みます。

　RP2350BのBOOTボタンを押しながらUSB-Cケーブルを接続するとパソコンがUSBメディアとして認識しますのでniseramfile.uf2をドロップすると自動的に書き込まれます。

　書き込みが終了するとパソコンからはUSBとして見えなくなりますのでそうなったらケーブルを抜いて終了です。

## MZ-2000_SD BOOT PROGRAMをMZ-1R12 SRAMメモリ 0番バックアップスロットへ書き込み
　MZ-2000_SDリポジトリEMMフォルダ内のBOOT_A_LOADER.binをMZ-1R12 SRAMメモリ 0番バックアップスロットへ書き込んでください。

https://github.com/yanataka60/MZ-1500_SD/blob/main/EMM/1Z-009B_SD_Launcher.bin

　書き込み方の詳細は偽RAMFILE for MZ-1500を参照してください。

https://github.com/shippoiincho/niseramfile/tree/main?tab=readme-ov-file#mz-1r12-sram-%E3%83%A1%E3%83%A2%E3%83%AA

　なお、書き込みにpicotool.exeを利用する場合には以下のウェブページ右側の「Releases」からダウンロードできます。

https://github.com/raspberrypi/pico-sdk-tools

　SDカードに「@BOOT-A MZ-2000.bin」を置いておく必要があります。作成方法は、MZ-2000_SDを参照してください。

　また、EMMから起動するためには、MZ-2000_SDリポジトリEMMフォルダ内の「@BOOT-EMM1.MZT」、「@BOOT-EMM2.MZT」、「@BOOT-EMM3.MZT」をSDカードにコピーしておく必要があります。

## Arduinoプログラム
　MZ-2000_SDを参照してください。

https://github.com/yanataka60/MZ-1500_SD/tree/main?tab=readme-ov-file#arduino%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%A0

## 運用の注意点
　偽RAMFILE for MZ-2000のEMMは自動的にバックアップされません。

　電源ON時に0番EMMスロットの内容が自動的にEMMにLOADされますが、電源OFF時にEMMの内容は消滅します。

　EMMの内容を書き込み・修正等した場合にはEMMの内容をスロットに書き込む動作を行う必要があります。

https://github.com/shippoiincho/niseramfile/tree/main?tab=readme-ov-file#pio-3034-emm

## EMMからの起動
　「EMM0」に起動可能なMZ-700用HuBASICが存在している場合MZ-1500_SDからコマンド「FDE0」を実行することで「EMM0」のMZ-700用HuBASICから起動可能です。

　なお、EMMの00000番地が「01h」でなければEMMからの起動はせずにコマンド待ちに戻りますが、00000番地以降に異常があってもチェックはしていないので最悪暴走します。

　MZ-1500用HuBASIC、MZ-80K用HuBASICではEMMがサポートされていません。EMMが使えるのはMZ-700用HuBASICのみとなりますが、テープ版しかなくそのままではEMMにHuBASICの起動イメージを作成することが出来ません。

　BouKiCHiさんのHuDiskなどを使いMZ-700用HuBASICの起動ディスクイメージを作成したうえでEMMMENUのEMMLOADでEMMに書き込む必要があります。

## SAMPLEプログラム
　SAMPLEフォルダ内にEMMMENU2を置きました。

　使い方については、フォルダ内のREADME.mdを参照してください。

　SDからEMMへLOAD、EMMの内容をSDへSAVE、EMMスロットからEMMへLOAD、EMMの内容をEMMスロットへSAVEが使えます。

## 拡張機能の使い方
### 外部起動SRAM MZ-1R12(便宜上この名前とします)
　MZ-2000を「/」キーを押しながら電源投入又はIPL RESETした時に読み込まれる起動プログラム「BOOT_A_LOADER.bin」が登録できます。

　前述の通り、MZ-1R12 SRAMメモリ 0番バックアップスロットへ書き込みことで電源投入又はIPL RESETした時に自動的に読み込まれます。

### EMM1:エミュレータ
　320kEMMとして機能します。バッテリーバックアップ機能はなく、電源断で内容は消失します。

　ただし、バックアップ用のSlotが32個用意されているので電源断前にSlotに退避しておくことが可能です。

　また、Slot0の内容は電源投入又はIPL RESETした時にEMM1に自動的にコピーされるのであたかもバッテリーバックアップされていたかのような使い方が出来ます。

#### Slotxxからの復帰
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Ch|W|指定したSlot番号(0～31)のSlotの内容をEMM1に復帰|

#### Slotxxへの退避
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|8Dh|W|指定したSlot番号(0～31)のSlotへEMM1の内容を退避|

#### EMMMENU

|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|A4h|R|アドレスカウンタリセット|
|A4h|W|アドレスカウンタ Bit[7:0]|
|A5h|W|アドレスカウンタ Bit[15:8]|
|A6h|W|アドレスカウンタ Bit[18:16]|
|A7h|R|データ読み出し:アドレスカウンタ+1|
|A7h|W|データ書き込み:アドレスカウンタ+1|

### 漢字・辞書ROM MZ-1R13
　漢字・辞書ROM MZ-1R13から抽出したデータを登録します。

### PCG
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|60h|W|キャラクタコードリセット|
|61h|W|キャラクタコード指定|
|62h|W|書き込みバンク指定(Blue:1,Red:2,Green:3)|
|63h|W|データ書き込み:キャラクタコード+1|
|67h|W|Bit1 優先順位 0:テキスト文字色＞PCG＞テキスト背景色|
|   | |              1:PCG＞テキスト|
|   | |Bit0 PCG表示  0:PCGを表示しない|
|   | |              1:PCGを表示する|

### テキストパレット設定
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|68h|W|上位4Bitで表す色コードを下位4Bitで表す色で表示する|
|   | |起動時設定|
|   | |          0x00|
|   | |          0x11|
|   | |          0x22|
|   | |          0x33|
|   | |          0x44|
|   | |          0x55|
|   | |          0x66|
|   | |          0x77|

### グラフィックパレット設定
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|69h|W|上位4Bitで表す色コードを下位4Bitで表す色で表示する|
|   | |起動時設定|
|   | |          0x00|
|   | |          0x11|
|   | |          0x22|
|   | |          0x33|
|   | |          0x44|
|   | |          0x55|
|   | |          0x66|
|   | |          0x77|

### FONT登録
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|70h|W|キャラクタコードリセット|
|71h|W|データ書き込み:キャラクタコード+1|
|72h|W|キャラクタコード指定|

### FONTカラー設定
|アドレス|R/W|説明|
| ------------ | ------------ | ------------ |
|78h|W|キャラクタコードリセット|
|79h|W|キャラクタ色(前景色)を上位4Bitで背景色を下位4Bitで指定する:キャラクタコード+1|
|7Ah|W|キャラクタコード指定|

　

## 謝辞
　素晴らしい拡張モジュールを開発し、複合ボードの公開を快く承諾してくださったしっぽいいんちょさん、ありがとうございました。

## 追記
2026.3.1 MZ-1500_SDリポジトリEMMフォルダ内の1Z-009B_SD_Launcher.binがCHECKSUM計算前のファイルをアップしており、正常起動できませんでしたので更新しました。