;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

CODE SEGMENT BYTE PUBLIC 'CODE'
ASSUME CS: CODE
	
_computeControlDigit PROC FAR
	
_computeControlDigit ENDP

_decodeBarCode PROC FAR	
;decodeBarCode(char (DB) (cadena de 13) barCodeStr, int (DW) (3) &countryCode, int (DW) (4) &companyCode, long (5) &productCode, char (1) &controlDigit)
; AL, BX, CX, AX:DX 
	;SACAR LA CADENA barCodeStr
	MOV BX, SP+6
	
ITERSTR1:		; CONVERTIR UN CARACTER
	MOV DX, 0
	MOV DL, [BX] 
	SUB DL, 30H 	; CONVERCION: STRING -> INT
	PUSH DX		; METE CARACTER CONVERTIDO A PILA
	INC BX
	CMP BL, MAT1[1]
	JNE ITERSTR1
	
	; METE EL NUMERO DESDE LA PILA A MATRIZ
	MOV NUMERO, 0
	MOV CX, 1	
ITERINT1:
	POP DX

	MOV AX, CX
	MUL DX		; DX * 10^N
	MOV DX, AX
	PUSH DX
	MOV AX, 10
	MUL CX	 	; CX * 10
	MOV CX, AX 	
	POP DX	
	ADD NUMERO, DX

	DEC BL
	CMP BL, 0
	JNE ITERINT1

	; PREPARA A QUE SE MUEVE DX A MATRIZ
	MOV DX, NUMERO
	MOV MATRIZ[0], DL

	
	MOV , [BX+1] 
	MOV , [BX+2] 
	MOV SP+8, ;countryCode [0123]
	
	MOV , [BX+3] 
	MOV , [BX+4] 
	MOV , [BX+5] 
	MOV , [BX+6] 
	
	MOV SP+10, ;companyCode [1234]
	
	MOV , [BX+7] 
	
	MOV SP+12, ;productCode [0001]
	
	MOV , [BX+8] 
	MOV , [BX+9] 
	MOV , [BX+10] 
	MOV , [BX+11] 
	
	MOV SP+14, ;productCode [2345]
	
	MOV BL, [BX+12] 
	MOV BH, 00H
	
	MOV SP+16, BX ;controlDigit [0001]
	RET
_decodeBarCode ENDP

INICIO ENDP 
CODE ENDS 
END INICIO 