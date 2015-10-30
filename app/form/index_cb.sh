#!/bin/bash

#function aceptar_cb {}

function reingresar_cb {
	firstText
}

function ingresar_cb {
	checkLogin ${txtValue[$txtI-1]} ${txtValue[$txtI]}
	if test $loginReturn -eq 1;then
		echo "Correcto!"
	else
		echo "Incorrecto!"
	fi
}

function salir_cb {
	clear	
	exit
}
