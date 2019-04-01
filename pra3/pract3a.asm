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
	PUSH BP
	MOV BP, SP

	LES BX, [BP+4]		; unsigned char* barCodeDigits
	MOV CL, 0
ITER:
	CMP CL, 12
	INC CL
	JGE ENDITER 		; if CL >= 12, end
	
	;MOV CX, [BP+CL] << HOW TO ACCESS??
	CMP CX, 0  	; acceso para el siguiente posicion del barCodeDigits	
	JNP IMPAR
PAR:
	ADD PARES, CX
	JMP ITER
IMPAR:
	MOV AX, 3
	MUL CX
	ADD IMPARES, CX
	JMP ITER
ENDITER:
	MOV CX, 0
	ADD CX, PARES
	ADD CX, IMPARES
	MOV AX, 10
	DIV CX	 		; AH guarda el resto de la divisi
	
	MOV AL, AH
	MOV AH, 0		; Devuelve resto

	;MOV AX, [BX+2]		; devuelve AX
	POP BP			; recupera la pila
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
