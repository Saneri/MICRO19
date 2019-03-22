/*********************************************************************
 * pract3.c
 *
 * Sistemas Basados en Microprocesador
 * 2018-2019
 * Practica 3
 * Codigos de Barras
 *
 *********************************************************************/
 
#include <stdio.h>
#include <stdlib.h>


/***** Declaracion de funciones *****/

/* Ejercicio 1 */

unsigned char computeControlDigit(unsigned char* barCodeDigits);
void createBarCode(int countryCode, long int companyCode, long int productCode, unsigned char controlDigit, unsigned char* out_barCodeASCII);
void decodeBarCode(unsigned char* in_barCodeASCII, unsigned int* countryCode, unsigned long int* companyCode, unsigned long int* productCode, unsigned char* controlDigit);



//////////////////////////////////////////////////////////////////////////
///// -------------------------- MAIN ------------------------------ /////
//////////////////////////////////////////////////////////////////////////
int main( void ){
	char barCodeStr[14],barCodeStrCorregido[14];
	unsigned char barCodeDigits[13];
	unsigned int  controlDigitCheck, countryCode;
	unsigned long int companyCode, productCode;
	unsigned char controlDigit;

	printf("Introduzca nuevo codigo de barras de 13 digitos: ");
	scanf("%s", &barCodeStr);

		
	decodeBarCode(barCodeStr, &countryCode, &companyCode, &productCode, &controlDigit);
	printf("Codigo de barras leido:\n");
	printf("- Codigo de Pais - %u -\n",countryCode);
	printf("- Codigo de Empresa - %lu -\n",companyCode);
	printf("- Codigo de Producto - %lu -\n",productCode);
	printf("- Codigo de Control - %u -\n",controlDigit);

	ControlDigitCheck = computeControlDigit(barCodeDigits);
	
	if(controlDigit != controlDigitCheck)
		printf("Error en codigo de control. Leido %u vs Calculado %u\n", controlDigit, controlDigitCheck);
		printf("Corrigiendo codigo de barras...\n");
		createBardCode(countryCode,companyCode,productCode,controlDigitCheck,barCodeStrCorregido);
		printf("Codigo de barras corregido es: %s\n",bardCodeStrCorregido);
	else
		printf("Codigo de control %u es correcto para el codigo de barras %s\n", controlDigit, barCodeStr);
	
	
	
	return 0;
}