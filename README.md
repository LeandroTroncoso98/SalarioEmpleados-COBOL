# SalarioEmpleados-COBOL
Escribe un programa en COBOL Batch que procese un archivo de entrada que contiene información sobre los empleados de una empresa. 
Cada registro del archivo tiene la siguiente estructura:
01 EMPLEADO-REGISTRO.
   05 CODIGO-EMPLEADO    PIC 9(5).
   05 NOMBRE-EMPLEADO    PIC X(30).
   05 SALARIO-BASE       PIC 9(7)V99.
   05 HORAS-EXTRAS       PIC 99.
   05 DESCUENTO-SS       PIC 9(7)V99.
   05 OTROS-DESCUENTOS   PIC 9(7)V99.
El programa debe calcular el sueldo neto de cada empleado utilizando la siguiente fórmula:

	SUELDO-NETO = (SALARIO-BASE + (HORAS-EXTRAS * 10)) - DESCUENTO-SS - OTROS-DESCUENTOS

Recuerda manejar adecuadamente los errores, como la apertura de archivos y la validación de datos. 

El formato del reporte debe ser el siguiente

 ------------------------------------------------------------------------------ 
|                        DETALLE DE SUELDO POR EMPLEADO                        |
 ------------------------------------------------------------------------------
|   NOMBRE: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX            CODIGO: XXXXX            |
|            								                                                   |
|------------------------------------| PAGOS         | DESCUENTOS |------------|
|   BASICO + ANTIGUEDAD              | XXXXXXX.XX    |            |            |
|   HORAS EXTRAS, CANT: XX HORAS     | XXXXXXX.XX    |            |            |
|   DESCUENTOS SEGURO SOCIAL         |               | XXXXXXX.XX |            |
|   DESCUENTOS VARIOS                |               | XXXXXXX.XX |            |
|                                              ------------------------	       |
|			                                        |SUELDO NETO: XXXXXXXX.XX|       |
|  				                                   	 ------------------------        |
|******************************************************************************|
|   NOMBRE: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   | CODIGO: XXXXX                   |
|                                                     								         |
|   				                         | PAGOS         | DESCUENTOS              |
|   BASICO + ANTIGUEDAD              | XXXXXXX.XX    |                         |
|   HORAS EXTRAS, CANT: XX HORAS     | XXXXXXX.XX    |                         |
|   DESCUENTOS SEGURO SOCIAL         |               | XXXXXXX.XX              |
|   DESCUENTOS VARIOS                |               | XXXXXXX.XX              |
| 					                                  ------------------------	       |
|			                                       |SUELDO NETO: XXXXXXXX.XX|        |
|  				                                  	------------------------	       |
|******************************************************************************|
| EMPLEADOS LEIDOS: XX                                                         |
 ------------------------------------------------------------------------------

