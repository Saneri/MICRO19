;**************************************************************************
; AUTORES: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

DATOS SEGMENT 
	MATRIZ		DB		'0', '7', '3', '4', '1', '6', '7', '8', '9' 
	MATRIZ2		DB		0, 7, 3, 4, 1, 6, 7, 8, 9, '$'
	NOMBRE		DB		"MATRIZ",'$'
	RESULTADO	DB		'1','1','7'
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
	
	;PRIMERA LINEA
	MOV AH, 2
	CALL TAB
	CALL BARRA 
	MOV DL, MATRIZ[0]
	INT 21H
	CALL ESPACIO
	MOV DL, MATRIZ[1]
	INT 21H
	CALL ESPACIO
	MOV DL, MATRIZ[2]
	INT 21H
	CALL BARRA
	CALL SALTO 
	
	;SEGUNDA LINEA
	MOV DX, OFFSET NOMBRE
	MOV AH, 9
	INT 21H
	MOV AH, 2
	CALL IGUAL
	CALL TAB
	CALL BARRA 
	MOV DL, MATRIZ[3]
	INT 21H	
	CALL ESPACIO
	MOV DL, MATRIZ[4]
	INT 21H
	CALL ESPACIO
	MOV DL, MATRIZ[5]
	INT 21H
	CALL BARRA
	CALL ESPACIO 
	CALL IGUAL 
	CALL ESPACIO
	MOV DL, RESULTADO ; COMPROBAR IMPRIMIR 1 POR 1
	INT 21H
	CALL SALTO
	
	;TERCERA LINEA
	CALL TAB
	MOV AH, 2
	CALL BARRA 
	MOV DL, MATRIZ[6]
	INT 21H
	CALL ESPACIO
	MOV DL, MATRIZ[7]
	INT 21H
	CALL ESPACIO
	MOV DL, MATRIZ[8]
	INT 21H
	CALL BARRA
	CALL SALTO
	
	; FIN DEL PROGRAMA 
	MOV AX, 4C00H 
	INT 21H 
	
	TAB PROC NEAR ; FUNCION QUE ESCRIBE UN TABULADO HORIZONTAL POR PANTALLA 
		MOV DL, 9H 
		INT 21H
		RET 
	TAB ENDP 
	
	BARRA PROC NEAR ;FUNCION PARA ESCRIBIR UNA BARRA LATERAL POR PANTALLA "|"
		MOV DL, 7CH
		INT 21H
		RET
	BARRA ENDP
	
	ESPACIO PROC NEAR ;FUNCION PARA ESCRIBIR UN ESPACIO POR PANTALLA
		MOV DL, 20H
		INT 21H
		RET
	ESPACIO ENDP
	
	IGUAL PROC NEAR ;FUNCION PARA ESCRIBIR POR PANTALLA EL SIMBOLO IGUAL "=" 
		MOV DL, 3D
		INT 21H
		RET
	IGUAL ENDP
	
	SALTO PROC NEAR ; FUNCION PARA ESCIBIR UN SALTO DE LINEA POR PANTALLA
		MOV DL, 0AH
		INT 21H
		RET
	SALTO ENDP
	
	CALCULAR PROC NEAR ;FUNCION CALCULAR DETERMINANTE DE MATRIZ (3X3)
		MOV AL, MATRIZ2[8];[2][2]
		MOV AH, MATRIZ2[4];[1][1]
		IMUL AH
		MOV BX, AX
		MOV AL, MATRIZ2[7];[2][1]
		MOV AH, MATRIZ2[5];[1][2]
		IMUL AH
		MOV CX, AX 	
		SUB BX, CX
		MOV AL, MATRIZ2[0];[0][0]
		IMUL BX
		PUSH AX
		
		MOV AL, MATRIZ2[3];[1][0]
		MOV AH, MATRIZ2[8];[2][2]
		IMUL AH
		MOV BX, AX
		MOV AL, MATRIZ2[5];[1][2]
		MOV AH, MATRIZ2[6];[2][0]
		IMUL AH
		MOV CX, AX 	
		SUB BX, CX
		MOV AL, MATRIZ2[1];[0][1]
		IMUL BX
		PUSH AX
		
		MOV AL, MATRIZ2[3];[1][0]
		MOV AH, MATRIZ2[7];[2][1]
		IMUL AH
		MOV BX, AX
		MOV AL, MATRIZ2[6];[2][0]
		MOV AH, MATRIZ2[4];[1][1]
		IMUL AH
		MOV CX, AX 	
		SUB BX, CX
		MOV AL, MATRIZ2[2];[0][2]
		IMUL BX
		PUSH AX
		
		POP CX
		POP BX
		POP AX
		SUB AX, BX 
		ADD CX, AX
		RET
	;FUNCION ACABA
	CALCULAR ENDP
	
INICIO ENDP 
CODE ENDS 
END INICIO 