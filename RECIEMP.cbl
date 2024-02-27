       IDENTIFICATION DIVISION.
       PROGRAM-ID. RECIEMP.
       AUTHOR. TRONCOSO LEANDRO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT EMPLEADOS ASSIGN EMP
           ORGANIZATION IS SEQUENTIAL
           ACCESS IS SEQUENTIAL
           FILE STATUS IS FS-EMPLEADO.

           SELECT RECIBO ASSIGN RECIB
           ORGANIZATION IS SEQUENTIAL
           ACCESS IS SEQUENTIAL
           FILE STATUS IS FS-RECIBO.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADOS RECORDING MODE IS F
                    DATA RECORD IS REG-EMPLEADO.
       01 REG-EMPLEADO.
          05 EMP-CODIGO           PIC 9(5).
          05 EMP-NOMBRE           PIC X(30).
          05 EMP-BASICO           PIC 9(7)V99.
          05 EMP-HEXTRAS          PIC 99.
          05 EMP-DESCUENTO-SS     PIC 9(7)V99.
          05 EMP-DESCUENTO-OTROS  PIC 9(7)V99.

       FD RECIBO RECORDING MODE IS F
                 DATA RECORD IS REG-RECIBO.
       01 REG-RECIBO              PIC X(80).

       WORKING-STORAGE SECTION.

       77 FS-EMPLEADO             PIC 99.
          88 FS-EMPLEADO-OK       VALUE 00.
          88 FS-EMPLEADO-END      VALUE 10.

       77 FS-RECIBO               PIC 99.
          88 FS-RECIBO-OK         VALUE 00.
          88 FS-RECIBO-END        VALUE 10.

       01 WS-GUIONES.
          05 FILLER               PIC X VALUE SPACE.
          05 FILLER               PIC X(78) VALUE ALL '-'.
          05 FILLER               PIC X VALUE SPACE.

       01 WS-TITULO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(24) VALUE SPACES.
          05 FILLER               PIC X(30)
                                 VALUE 'DETALLE DE SUELDO POR EMPLEADO'..
          05 FILLER               PIC X(24) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-NOMBRE-CODIGO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(3) VALUE SPACES.
          05 FILLER               PIC X(8) VALUE 'NOMBRE: '.
          05 WS-EMP-NOMBRE        PIC X(30).
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X(8) VALUE 'CODIGO: '.
          05 WS-EMP-CODIGO        PIC 9(5).
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-ESPACIO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(78) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-SUBTITULOS.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(36) VALUE ALL '-'.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(5) VALUE SPACES.
          05 FILLER               PIC X(5) VALUE 'PAGOS'.
          05 FILLER               PIC X(5) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE ' DESCUENTOS '.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE ALL '-'.
          05 FILLER               PIC X VALUE '|'.

       01 WS-SUELDO-BASICO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(3) VALUE SPACES.
          05 FILLER               PIC X(19)
                                  VALUE 'BASICO + ANTIGUEDAD'.
          05 FILLER               PIC X(14) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X VALUE SPACE.
          05 WS-EMP-BASICO        PIC $$$$$$9,99.
          05 FILLER               PIC X(4) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-HORAS-EXT.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(3) VALUE SPACES.
          05 FILLER               PIC X(20)
                                  VALUE 'HORAS EXTRAS, CANT: '.
          05 WS-EMP-HEXTRAS       PIC 99.
          05 FILLER               PIC X(6) VALUE ' HORAS'.
          05 FILLER               PIC X(5) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X VALUE SPACE.
          05 WS-HORAS             PIC $$$$$$9,99.
          05 FILLER               PIC X(4) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-SEGURO-SOCIAL.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(3) VALUE SPACES.
          05 FILLER               PIC X(24)
                                  VALUE 'DESCUENTOS SEGURO SOCIAL'.
          05 FILLER               PIC X(9) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(15) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X VALUE SPACE.
          05 WS-EMP-DESCUENTO-SS  PIC $$$$$$9,99.
          05 FILLER               PIC X VALUE SPACE.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-DESCUENTOS-VARIOS.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(3) VALUE SPACES.
          05 FILLER               PIC X(17)
                                  VALUE 'DESCUENTOS VARIOS'.
          05 FILLER               PIC X(16) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(15) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X VALUE SPACE.
          05 WS-EMP-DESC-OTROS    PIC $$$$$$9,99.
          05 FILLER               PIC X VALUE SPACE.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(12) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-GUIONES-NETO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(39) VALUE SPACES.
          05 FILLER               PIC X(24) VALUE ALL '-'.
          05 FILLER               PIC X(15) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-SUELDO-NETO.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(38) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(13) VALUE 'SUELDO NETO: '.
          05 WS-EMP-SUELDO-NETO   PIC $$$$$$$9,99.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(14) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       01 WS-SEPARACION-ASTER.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X(78) VALUE ALL '*'.
          05 FILLER               PIC X VALUE '|'.

       01 WS-LEIDOS.
          05 FILLER               PIC X VALUE '|'.
          05 FILLER               PIC X VALUE SPACE.
          05 FILLER               PIC X(18)
                                 VALUE "EMPLEADOS LEIDOS: ".
          05 WS-EMP-LEIDOS        PIC 99.
          05 FILLER               PIC X(57) VALUE SPACES.
          05 FILLER               PIC X VALUE '|'.

       77 WS-SUELDO-CAL           PIC 9(8)V99.
       77 WS-HEXTRA-CAL           PIC 9(8)V99.

       PROCEDURE DIVISION.

       0100-INICIAR-PROGRAMA.
           PERFORM 0110-INICIALIZAR-VAR
           PERFORM 0200-ABRIR-FICHEROS
           PERFORM 0300-PROCESO-IMPRESION
           PERFORM 0600-CERRAR-FICHEROS
           PERFORM 0700-CLOSE-PROGRAM.


       0110-INICIALIZAR-VAR.
           INITIALIZE WS-SUELDO-CAL
           INITIALIZE WS-HEXTRA-CAL
           INITIALIZE WS-EMP-LEIDOS.

       0200-ABRIR-FICHEROS.
           OPEN INPUT EMPLEADOS
           IF NOT FS-EMPLEADO-OK THEN
            DISPLAY "FS-EMPLEADO: " FS-EMPLEADO
            PERFORM 0700-CLOSE-PROGRAM
           END-IF
           OPEN OUTPUT RECIBO.
           IF NOT FS-RECIBO-OK THEN
            DISPLAY "FS-RECIBO: " FS-RECIBO
            PERFORM 0700-CLOSE-PROGRAM
           END-IF.


       0300-PROCESO-IMPRESION.
           WRITE REG-RECIBO         FROM WS-GUIONES
           WRITE REG-RECIBO         FROM WS-TITULO
           WRITE REG-RECIBO         FROM WS-GUIONES
           READ EMPLEADOS
           PERFORM 0400-LEER-EMPLEADO UNTIL FS-EMPLEADO-END
           WRITE REG-RECIBO         FROM WS-LEIDOS
           WRITE REG-RECIBO         FROM WS-GUIONES.

       0400-LEER-EMPLEADO.
           ADD 1 TO WS-EMP-LEIDOS
           MOVE EMP-CODIGO          TO WS-EMP-CODIGO
           MOVE EMP-NOMBRE          TO WS-EMP-NOMBRE
           MOVE EMP-BASICO          TO WS-EMP-BASICO
           MOVE EMP-HEXTRAS         TO WS-EMP-HEXTRAS
           MOVE EMP-DESCUENTO-SS    TO WS-EMP-DESCUENTO-SS
           MOVE EMP-DESCUENTO-OTROS TO WS-EMP-DESC-OTROS
           PERFORM 0420-CALCULAR-HEXTRA
           MOVE WS-HEXTRA-CAL       TO WS-HORAS
           PERFORM 0410-CALCULAR-NETO
           MOVE WS-SUELDO-CAL       TO WS-EMP-SUELDO-NETO
           READ EMPLEADOS
           PERFORM 0500-ESCRIBIR-EMPLEADO.

       0410-CALCULAR-NETO.
           COMPUTE
            WS-SUELDO-CAL = (EMP-BASICO + (EMP-HEXTRAS * 10)) -
                          EMP-DESCUENTO-SS - EMP-DESCUENTO-OTROS.


       0420-CALCULAR-HEXTRA.
           COMPUTE
            WS-HEXTRA-CAL = EMP-HEXTRAS * 10.


       0500-ESCRIBIR-EMPLEADO.
           WRITE REG-RECIBO         FROM WS-NOMBRE-CODIGO
           WRITE REG-RECIBO         FROM WS-ESPACIO
           WRITE REG-RECIBO         FROM WS-SUBTITULOS
           WRITE REG-RECIBO         FROM WS-SUELDO-BASICO
           WRITE REG-RECIBO         FROM WS-HORAS-EXT
           WRITE REG-RECIBO         FROM WS-SEGURO-SOCIAL
           WRITE REG-RECIBO         FROM WS-DESCUENTOS-VARIOS
           WRITE REG-RECIBO         FROM WS-GUIONES-NETO
           WRITE REG-RECIBO         FROM WS-SUELDO-NETO
           WRITE REG-RECIBO         FROM WS-GUIONES-NETO
           WRITE REG-RECIBO         FROM WS-SEPARACION-ASTER.


       0600-CERRAR-FICHEROS.
           CLOSE EMPLEADOS
           CLOSE RECIBO.

       0700-CLOSE-PROGRAM.
           STOP RUN.
