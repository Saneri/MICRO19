;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

DATOS SEGMENT 
	MATRIZ1			DB		2, 3, 4, 5, 6, 7
	MATRIZ2			DB		8, 9, 'A', 'B', 'C', 'D'
	MATRIZ3			DB		'E', 'F', 'G', 'H', 'I', 'J' 
	MATRIZ4			DB		'K', 'L', 'M', 'N', 'O', 'P'
	MATRIZ5			DB		'Q', 'R', 'S', 'T', 'U', 'V'
	MATRIZ6			DB		'W', 'X', 'Y', 'Z', 0, 1 
	MATRIZ			DB		2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J' , 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 0, 1 
	NUMERO			DB		9,'$'
	NOMBRE			DB		"PABLO ROSALES Y SANTERI SUITIALA",'$'
	INSTRUCCIONES1	DB		"Ejecutar sin parámetros: muestre el estado de instalación del driver, num de grupo (versión Polibio), nombres de la pareja y las instrucciones de uso.",'$'
	INSTRUCCIONES2	DB		"Ejecutar con el parámetro /I: instale el driver caso que no lo esté ya.",'$'
	INSTRUCCIONES3	DB		"Ejecutar con el parámetro /D: desinstale el driver caso de estar instalado .",'$'
	CADENA			DB		30 DUP ('$')
DATOS ENDS 

PILA SEGMENT STACK "STACK" 
	DB 50H DUP (0)
PILA ENDS 

CODE SEGMENT 
ASSUME CS: CODE, DS: DATOS, SS: PILA 

INICIO PROC 

	MOV AX, DATOS 
	MOV DS, AX 
	MOV AX, PILA 
	MOV SS, AX 
	MOV SP, 64 
	;COMIENZO DEL PROGRAMA 
	
	MOV AH, 10H
	
	CALL RESIDENTE
	
RESIDENTE PROC NEAR
	CMP AH, 10H
	JE COD
	JB DECOD

COD:	MOV
	MOV
LOOP1: 	MOV
	
	
	
	JMP FINAL
	
	
	
DECOD:	MOV	
	MOV
LOOP2: 	MOV

FINAL RET
RESIDENTE ENDP	

POLIBIO2DEC PROC NEAR ;FUNCION PARA CONVERTIR UN NUMERO POLIBIO A DECIMAL
	MOV CX, 0
	MOV BX, 10
	
	MOV DX, 0
	DIV BX
	DEC AX
	MOV CL, 6
	MUL CL
	ADD AX, DX

	RET
POLIBIO2DEC ENDP

DEC2POLIBIO PROC NEAR ;FUNCION PARA CONVERTIR UN NUMERO DECIMAL A POLIBIO 
	MOV CX, 0
	MOV BX, 10
	
	MOV DX, 0
	DIV BX
	CMP DX, 0
	JE CERO
	JA NOCERO
	
CERO	MOV BL, 10
	MUL BL
	ADD AX, 6
	JMP FINAL
	
NOCERO	INC AX
	MOV BL, 10
	MUL BL
	ADD AX, DX
	
FINAL	RET
DEC2POLIBIO ENDP
	
HEX2DEC PROC NEAR ;FUNCION PARA CONVERTIR UN NUMERO HEXADECIMAL A CADENA ASCII
	MOV CX, 0
	MOV BX, 6
	
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

RESET PROC NEAR ;FUNCION QUE RESETEA LA CADENA QUE SE IMPRIME
	MOV CADENA[0], '$'
	MOV CADENA[1], '$'
	MOV CADENA[2], '$'
	MOV CADENA[3], '$'
	MOV CADENA[4], '$'
	MOV CADENA[5], '$'
	MOV CADENA[6], '$'
	MOV CADENA[7], '$'
	MOV CADENA[8], '$'
	MOV CADENA[9], '$'
	MOV CADENA[10], '$'
	MOV CADENA[11], '$'
	MOV CADENA[12], '$'
	MOV CADENA[13], '$'
	MOV CADENA[14], '$'
	MOV CADENA[15], '$'
	MOV CADENA[16], '$'
	MOV CADENA[17], '$'
	MOV CADENA[18], '$'
	MOV CADENA[19], '$'
	MOV CADENA[20], '$'
	MOV CADENA[21], '$'
	MOV CADENA[22], '$'
	MOV CADENA[23], '$'
	MOV CADENA[24], '$'
	MOV CADENA[25], '$'
	MOV CADENA[26], '$'
	MOV CADENA[27], '$'
	MOV CADENA[28], '$'
	MOV CADENA[29], '$'
RESET ENDP
	


INICIO ENDP 
CODE ENDS 
END INICIO 
