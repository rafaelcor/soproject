#!/bin/bash

#function aceptar_cb {}

function reingresar_cb {
	firstText
}

function ingresar_cb {
	if test $(checkLogin ${txtValue[$txtI-1]} ${txtValue[$txtI]}) -eq 1;then
		#if correct
		userName=${txtValue[$txtI-1]}
		if test $(checkCash $userName) -eq 1; then
			loadForm logged
		else
			errorMsg Usted_debe_gastos_comunes 30 20		
			firstText
		fi
	else
		firstText
		#if not correct
		
	fi
	#end if
}

function salir_cb {
	clear	
	exit
}
