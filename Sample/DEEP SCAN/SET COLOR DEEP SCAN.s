		ORG	0B000H

		XOR	A
		OUT	(072H),A	;キャラクタコード<-00h
		LD	HL,FONT		;ラベルFONT以降に連結されたFONTデータでFONTを再定義
		LD	BC,0800h
LOP1:		LD	A,(HL)
		OUT	(071H),A
		INC	HL
		DEC	BC
		LD	A,B
		OR	C
		JR	NZ,LOP1
		
		LD	A,74H
		OUT	(068H),A	;テキストパレットで色コード7を緑に指定
		
		LD	A,2AH
		OUT	(07AH),A	;2Ah'*'の色を赤に指定
		LD	A,20H
		OUT	(079H),A

		LD	A,60H
		OUT	(07AH),A	;60hから5文字の色を赤に指定
		LD	A,20H
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A

		LD	A,6FH
		OUT	(07AH),A	;6Fhから2文字の色を赤に指定
		LD	A,20H
		OUT	(079H),A
		OUT	(079H),A

		LD	A,65H
		OUT	(07AH),A	;65hから10文字の色を青に指定
		LD	A,10H
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A

		LD	A,75H
		OUT	(07AH),A	;75hから5文字を水色に指定
		LD	A,50H
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A

		LD	A,0A5H
		OUT	(07AH),A	;A5hを水色に指定
		LD	A,50H
		OUT	(079H),A

		LD	A,0F0H
		OUT	(07AH),A	;F0hから11文字を水色に指定
		LD	A,50H
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A
		OUT	(079H),A

		LD	A,0AAH
		OUT	(07AH),A	;AAhを黄色に指定
		LD	A,60H
		OUT	(079H),A
		LD	A,0B4H

		OUT	(07AH),A	;B4hを黄色に指定
		LD	A,60H
		OUT	(079H),A
		LD	A,2BH

		OUT	(07AH),A	;2Bh'+'を赤に指定
		LD	A,20H
		OUT	(079H),A
		
		JP	00B1H		;MONITORに復帰

FONT:		ds	2047		;MZTヘッダ用に仮に設定
		db	0FFh

			END
