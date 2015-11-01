#!/bin/bash

function procesar_cb {
	echo Procesando
	fechaReserva=${txtValue[$(expr $txtI - 2)]}
	horaInicio=${txtValue[$(expr $txtI - 1)]}
	horaFin=${txtValue[$(expr $txtI)]}
	
	if [[ "$fechaReserva" =~ [0-9][0-9]|[0-9]-[0-9][0-9]|[0-9]-[0-9][0-9][0-9][0-9] ]] && [[ "$horaInicio" =~ [0-9][0-9]|[0-9]:[0-9][0-9] ]] && [[ "$horaFin" =~ [0-9][0-9]|[0-9]:[0-9][0-9] ]] && test $(abs $(expr $(date -ud "$horaInicio" +"%s") - $(date -ud "$horaFin" +"%s"))) -le 21600 && test $(date -ud "$horaFin" +"%H") -ne 2 && test $(date -ud "$horaInicio" +"%H") -ne 2 ;then
		#&& test $(echo "$fechaReserva" | tr '-' "\n") -ge $(expr $(date +%Y))
		echo "Horas válidas"
		fechaYTemp=($(echo "$fechaReserva" | tr '-' "\n"))
		fechaTemp=$(date -d ${fechaYTemp[2]}-${fechaYTemp[1]}-${fechaYTemp[0]} +"%Y%m%d")
		if [ "$fechaTemp" -ge $(date +"%Y%m%d") ];then
			echo "if defin"
		else
			echo "dentroifelse"
		fi
		
	else
		echo "No"
	fi
	
}

function cancelar_cb {
	echo Cancelado
}

function volver_cb {
	txtI=0 # Fix 0
	firstText
	firstButton
}
