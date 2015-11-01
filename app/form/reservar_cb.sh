#!/bin/bash

function procesar_cb {
	echo Procesando
	fechaReserva=${txtValue[$(expr $txtI - 2)]}
	horaInicio=${txtValue[$(expr $txtI - 1)]}
	horaFin=${txtValue[$(expr $txtI)]}
	
	if test $(abs $(expr $(date -ud "$horaInicio" +"%s") - $(date -ud "$horaFin" +"%s"))) -le 21600 && test $(date -ud "$horaFin" +"%H") -ne 2 && test $(date -ud "$horaInicio" +"%H") -ne 2;then
		echo "Horas válidas"
	else
		echo "No"
	fi
	
}

function cancelar_cb {
	echo Cancelado
}
