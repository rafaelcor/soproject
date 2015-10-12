#!/bin/bash

# Color por defecto de los botones
btnColor=(1 7 2 1)
# Arrays que almacenan la posicion de los botones y su tamaño
btnX=()
btnY=()
btnL=()
btnI=0

# Color por defecto de los textbox
txtColor=(7 0)
# Arrays que almacenan la posicion de los textbox y su tamaño
txtX=()
txtY=()
txtL=()
txtI=0


# Define el color de los botones
function defBtnColor {
	btnColor=($1 $2 $3 $4)
}
# Crea un nuevo boton
function button {
	goto $2 $3
	fontColor ${btnColor[0]} ${btnColor[1]}	
	local label="<"$1">"
	echo -n $label

	btnX+=$2
	btnY+=$3
	btnL+=${#label}

	defaultColor
}


# Define el color de los textbox
function defTxtColor {
	txtColor=($1 $2)
}
# Crea un nuevo textbox
function textbox {
	goto $2 $3
	fontColor ${txtColor[0]} ${txtColor[1]}
	local len=0
	for i in $(seq $1); do echo -n " "; local len=$(expr $len + 1); done

	txtX+=$2
	txtY+=$3
	txtL+=$len
	
	defaultColor
}

# Carga un form
function loadForm {
	cat form/$1
	source ./form/$1.sh
}
