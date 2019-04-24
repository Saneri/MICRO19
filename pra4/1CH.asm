;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

DATOS SEGMENT 
	CONT		DB		0
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
	
	INC CONT
	CMP CONT, 18
	JNE FIN
	MOV CONT, 0
	;CODIGO
	
	FIN RET
INICIO ENDP 
CODE ENDS 
END INICIO 