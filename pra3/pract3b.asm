;**************************************************************************
; AUTOCAD: PABLO ROSALES Y SANTERI SUITIALA
; PAREJA 9  
;*************************************************************************

DGROUP GROUP _DATA, _BSS				;; Se agrupan segmentos de datos en uno

_DATA SEGMENT WORD PUBLIC 'DATA' 		;; Segmento de datos DATA público

_DATA ENDS

_BSS SEGMENT WORD PUBLIC 'BSS'			;; Segmento de datos BSS público

_BSS ENDS

_TEXT SEGMENT BYTE PUBLIC 'CODE' 		;; Definición del segmento de código
ASSUME CS:_TEXT, DS:DGROUP, SS:DGROUP

PUBLIC _createBarCode
_createBarCode PROC FAR
	PUSH BP;
	MOV BP, SP;
	
	MOV AX, [BP+6]
	
	POP BP
	RET
_createBarCode ENDP

_TEXT ENDS
END