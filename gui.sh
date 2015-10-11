#!/bin/bash

# Arrays que almacenan la posicion de los botones y su tamaño
btnX=()
btnY=()
btnL=()

# Define el color de los botones
function defBtnColor {
	btn=($1 $2)
}

# Crea un nuevo boton
function button {
	goto $2 $3
	fontColor ${btn[*]}	
	local label="<"$1">"
	echo -n $label

	btnX+=$2
	btnY+=$3
	btnL+=${#label}

	defaultColor
}
