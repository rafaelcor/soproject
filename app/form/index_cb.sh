#!/bin/bash

#function aceptar_cb {}

function reingresar_cb {
	firstText
}

function ingresar_cb {
	if test $(checkLogin ${txtValue[$txtI-1]} ${txtValue[$txtI]}) -eq 1;then
		#if correct
		userName=${txtValue[$txtI-1]}
		defTermColor 4 7
		defaultColor
		clear
		loadForm logged
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
