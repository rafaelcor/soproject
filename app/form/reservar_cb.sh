#!/bin/bash

function procesar_cb {
	echo Procesando
	#$(($(date -ud "19:00" +"%s")-$(date -ud "17:00" +"%s")))
	fechaReserva=${txtValue[$(expr $txtI - 2)]}
	horaInicio=${txtValue[$(expr $txtI - 1)]}
	horaFin=${txtValue[$(expr $txtI)]}
	
	if test $(($(date -ud "$horaFin" +"%s")-$(date -ud "$horaInicio" +"%s"))) -le 21600 && test $(date -ud "$horaFin" +"%s") -le 1446256800;then
		echo "Horas válidas"
	else
		echo "No"
	fi
	
}

function cancelar_cb {
	echo Cancelado
}
