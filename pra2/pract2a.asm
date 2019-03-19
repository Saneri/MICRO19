;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

DATOS SEGMENT 
	MATRIZ		DB		1, -3, 8, 6, -5, 3, 1, -2, 4
	NOMBRE		DB		"MATRIZ",'$'
	CAD			DB		10 DUP ('$')
	RES			DW		0000H
DATOS ENDS 

PILA SEGMENT STACK "STACK" 
	DB 10H DUP (0)
PILA ENDS 

CODE SEGMENT 
ASSUME CS: CODE, DS: DATOS, SS: PILA 

INICIO PROC 

	MOV AX, DATOS 
	MOV DS, AX 
	MOV AX, PILA 
	MOV SS, AX 
	MOV SP, 64 
	; COMIENZO DEL PROGRAMA 
	
	CALL CALCULAR
	
	MOV RES, CX
	
	;PRIMERA LINEA
	CALL TAB
	CALL BARRA 
	
	MOV AH, 00
	MOV AL, MATRIZ[0]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS0
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS0:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[1]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS1
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS1:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[2]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS2
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS2:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL BARRA
	CALL SALTO 
	
	;SEGUNDA LINEA
	MOV DX, OFFSET NOMBRE
	MOV AH, 9
	INT 21H
	CALL IGUAL
	
	CALL TAB
	CALL BARRA 
	
	MOV AH, 00
	MOV AL, MATRIZ[3]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS3
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS3:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[4]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS4
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS4:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[5]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS5
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS5:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL BARRA
	CALL ESPACIO 
	CALL IGUAL 
	CALL ESPACIO
	
	
	MOV AX, RES
	
	MOV BL, 129
	MOV BH, 00H
	CMP BX, AX
	JAE POS
	NEG AX
POS:	LEA SI, CAD
	CALL HEX2DEC
	
	MOV AX, RES
	
	MOV BL, 129
	MOV BH, 00H
	CMP BX, AX
	JAE POSA
	CALL NEGATIVO
POSA:	LEA DX, CAD		;SE REALIZAN DOS COMPARACIONES PORQUE CUANDO SE IMPRIME EL SIMBOLO MENOS "-"
	MOV AH, 9			;AH SE CAMBIA A "02", PISANDO ASI EL RESULTADO DE LA MATRIZ
	INT 21H
	
	CALL SALTO
	
	;TERCERA LINEA
	CALL TAB
	CALL BARRA 

	MOV AH, 00
	MOV AL, MATRIZ[6]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS6
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS6:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[7]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS7
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS7:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL TAB
	
	MOV AH, 00	
	MOV AL, MATRIZ[8]
	
	MOV BH, 129
	CMP BH, AL
	JAE POS8
	CALL NEGATIVO
	NEG AL
	MOV AH, 00H
POS8:	LEA SI, CAD
	CALL HEX2DEC
	
	LEA DX, CAD
	MOV AH, 9
	INT 21H
	
	CALL BARRA
	CALL SALTO
	
	; FIN DEL PROGRAMA 
	MOV AX, 4C00H 
	INT 21H 
	
TAB PROC NEAR ; FUNCION QUE ESCRIBE UN TABULADO HORIZONTAL POR PANTALLA 
	MOV AH, 2
	MOV DL, 9H 
	INT 21H
	RET 
TAB ENDP 
	
BARRA PROC NEAR ;FUNCION PARA ESCRIBIR UNA BARRA LATERAL POR PANTALLA "|"
	MOV AH, 2
	MOV DL, 7CH
	INT 21H
	RET
BARRA ENDP
	
ESPACIO PROC NEAR ;FUNCION PARA ESCRIBIR UN ESPACIO POR PANTALLA
	MOV AH, 2
	MOV DL, 20H
	INT 21H
	RET
ESPACIO ENDP

IGUAL PROC NEAR ;FUNCION PARA ESCRIBIR POR PANTALLA EL SIMBOLO IGUAL "=" 
	MOV AH, 2
	MOV DL, 3DH
	INT 21H
	RET
IGUAL ENDP
	
SALTO PROC NEAR ; FUNCION PARA ESCIBIR UN SALTO DE LINEA POR PANTALLA
	MOV AH, 2
	MOV DL, 0AH
	INT 21H
	RET
SALTO ENDP
	
NEGATIVO PROC NEAR ;FUNCION PARA ESCRIBIR POR PANTALLA EL SIMBOLO MENOS "-" 
	MOV AH, 2
	MOV DL, 2DH 
	INT 21H
	RET 
NEGATIVO ENDP
	
HEX2DEC PROC NEAR ;FUNCION PARA CONVERTIR EL CADULTADO A CADENA ASCII
	MOV CX, 0
	MOV BX, 10
	
LOOP1:	MOV DX, 0
	DIV BX
	ADD DL, 30H
	PUSH DX
	INC CX
	CMP AX, 9
	JG LOOP1
	
	ADD AL, 30H
	MOV [SI], AL
	
LOOP2:	POP AX
	INC SI
	MOV [SI], AL
	LOOP LOOP2
	RET
	
HEX2DEC ENDP
	
CALCULAR PROC NEAR ;FUNCION CALCULAR DETERMINANTE DE MATRIZ (3X3)
	MOV AL, MATRIZ[8];[2][2]
	MOV AH, MATRIZ[4];[1][1]
	IMUL AH
	MOV BX, AX
	MOV AL, MATRIZ[7];[2][1]
	MOV AH, MATRIZ[5];[1][2]
	IMUL AH
	MOV CX, AX 	
	SUB BX, CX
	MOV AL, MATRIZ[0];[0][0]
	IMUL BX
	PUSH AX
	
	MOV AL, MATRIZ[3];[1][0]
	MOV AH, MATRIZ[8];[2][2]
	IMUL AH
	MOV BX, AX
	MOV AL, MATRIZ[5];[1][2]
	MOV AH, MATRIZ[6];[2][0]
	IMUL AH
	MOV CX, AX 	
	SUB BX, CX
	MOV AL, MATRIZ[1];[0][1]
	IMUL BX
	PUSH AX
	
	MOV AL, MATRIZ[3];[1][0]
	MOV AH, MATRIZ[7];[2][1]
	IMUL AH
	MOV BX, AX
	MOV AL, MATRIZ[6];[2][0]
	MOV AH, MATRIZ[4];[1][1]
	IMUL AH
	MOV CX, AX 	
	SUB BX, CX
	MOV AL, MATRIZ[2];[0][2]
	IMUL BX
	PUSH AX
	
	POP CX
	POP BX
	POP AX
	SUB AX, BX 
	ADD CX, AX
	RET
CALCULAR ENDP

INICIO ENDP 
CODE ENDS 
END INICIO 