#!/bin/bash

source ./form/reservar_cb.sh # Fix 1
txtI=0 # Fix 0

#button Realizar_Reserva 7 28 realizar_cb
textbox 10 5 42
textbox 5 7 42
textbox 5 9 42

button Procesar 13 15 procesar_cb
button Volver_a_ingresar 13 28 reingresarFecha_cb
button Cancelar 13 49 cancelar_cb

firstText
firstButton
#abs_value=-1234; echo ${abs_value#-}
c=1
while test $c=1; do #while true-sama
	#if test ${txtValue[$(expr $txtI - 2)]} -eq ${txtValue[$(expr $txtI - 2)]} 2>/dev/null; then
		controlButton s w
	#else
	#	firstText
	#fi
done


