;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

_DATA SEGMENT WORD PUBLIC ‘DATA’
	PARES		DW	;max 351
	IMPARES		DW	;max 117  Utilizo dw en ambos para facilitar
_DATA ENDS

_CODE SEGMENT BYTE PUBLIC 'CODE'
	ASSUME CS: _CODE, DS:_DATA
	PUBLIC _computeControlDigit, _decodeBarCode
_computeControlDigit PROC FAR
	PUSH SI DS BX CX DX DI BP
	MOV BP, SP

	; unsigned char* barCodeDigits
	MOV SI, [BP+18]			; Offset
	MOV DS, WORD PTR [BP+20]	; Segment
	
	ADD SI, 36 ; <- hack (36-65)
	XOR DI, DI  		; DI = 0
	XOR BX, BX		; cadena para pares
	XOR CX, CX		; cadena para impares
ITER:	
	XOR AX, AX 
	LODSB			; carga barCodeDigit aAL
	SUB AL, 48		; str to int
	
	INC DI			
	CMP DI, 12
	JGE ENDITER 		; if DI >= 11, end
	
	CMP AL, 0  		; par o impar	
	INC SI			; acceso para el siguiente posicion del barCodeDigits
	JNP IMPAR
	
	ADD BX, AX
	JMP ITER
IMPAR:
	PUSH CX
	MOV CX, AX
	MOV AX, 3
	MUL CX
	POP CX
	ADD CX, AX
	
	JMP ITER
ENDITER:
	XOR AX, AX  		; AX = 0
	ADD AX, BX
	ADD AX, CX
	MOV CX, 000Ah
	DIV CX	 		; DX guarda el resto de la division

	MOV AX, DX		; devuelve AX
	POP BP DI DX CX BX DS SI	; recupera la pila
	RET

_computeControlDigit ENDP

_decodeBarCode PROC FAR	
;decodeBarCode(char (DB) (cadena de 13) barCodeStr, int (DW) (3) &countryCode, int (DW) (4) &companyCode, long (5) &productCode, char (1) &controlDigit)
;decodeBarCode(char(cadena de 13) barCodeStr, int(3) &countryCode, long(4) &companyCode, long(5) &productCode, char(1) &controlDigit)
	PUSH BP;
	MOV BP, SP;
;barCodeStr [845 6789 01234 5]
	MOV DI, [BP+6]
	
;countryCode [845]
	LES BX, [BP+10]
	MOV SI, ES
	
	;MOV DH, [DI]
	;MOV DL, [DI+2]
	MOV DX, 0000H
	
	;MOV [BX], DH
	;MOV [BX+2], DL
	
	;MOV [BX], DX
	MOV [SI], DX
	
;companyCode [6789]
	LES BX, [BP+14]
	MOV SI, ES
	
	;MOV DH, [DI+4]
	;MOV DL, [DI+6]
	MOV DX, 0000H
	
	;MOV [BX+1], DH
	;MOV [BX+3], DL 
	
	;MOV [BX], DX
	MOV [SI], DX
	
;productCode [01234]
	LES BX, [BP+18]
	MOV SI, ES
	
	;MOV CL, [DI+7]
	;MOV DH, [DI+9]
	;MOV DL, [DI+11]
	MOV DX, 0000H
	
	;MOV [BX], CL
	;MOV [BX+2], DH
	;MOV [BX+4], DL 
	
	;MOV [BX], DX
	MOV [SI], DX
	
;controlDigit [5]
	LES BX, [BP+22]
	MOV SI, ES
	
	;MOV DH, [DI+12]
	MOV DH, 00
	
	;MOV [BX], DH
	MOV [SI], DH

	POP BP
	RET
_decodeBarCode ENDP
_CODE ENDS 
END
