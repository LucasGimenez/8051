        ORG 810H
        MOV TMOD,#01H ;Temporizador modo 16 bits.

CICLO:
        MOV TH0,#0FEH ;-500 (byte superior).
        MOV TL0,#OCH ; -500 (byte inferior).
        SETB TR0 ; Iniciamos el temporizador.

ESPERA:
        JNB TF0,ESPERA ; Esperamos el desbordamiento del TMR0.
        CLR TR0 ; Apagamos el temporizador.
        CLR TF0 ; Limpiamos la bandera de desborde del timer.

        CPL P1.0 ; Complementamos la salida por el pin 0 del puerto 1.
        SJMP CICLO ; Volvemos con un salto a "CICLO", repite la secuencia (comienzo).

END

