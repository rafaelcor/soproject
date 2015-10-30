#!/bin/bash

#function aceptar_cb {}

function reingresar_cb {
	firstText
}

function ingresar_cb {
	if test $(checkLogin ${txtValue[$txtI-1]} ${txtValue[$txtI]}) -eq 1;then
		echo "Correcto!"
	else
		echo "Incorrecto!"
	fi
}

function salir_cb {
	clear	
	exit
}
