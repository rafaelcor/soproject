#!/bin/bash

# Color por defecto de los botones
btnColor=(1 7 2 1)
# Arrays que almacenan la posicion de los botones y su tamaño
btnX=()
btnY=()
btnL=()
btnI=0
btnCb=()

# Color por defecto de los textbox
txtColor=(7 0)
# Arrays que almacenan la posicion de los textbox y su tamaño
txtX=()
txtY=()
txtL=()
txtI=0
txtValue=()


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

	btnX+=($2)
	btnY+=($3)
	btnL+=(${#label})
	btnCb+=$4

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

	txtX+=($2)
	txtY+=($3)
	txtL+=($len)
	
	defaultColor
}

# Carga un form
function loadForm {
	cat form/$1.form
	source ./form/$1.sh
	source ./form/$1_cb.sh
}

# Va al primer textbox y lo borra
function firstText {
	fontColor ${txtColor[0]} ${txtColor[1]}
	goto ${txtX[0]} ${txtY[0]}
	for i in $(seq ${txtL[0]}); do echo -n " "; done
	goto ${txtX[0]} ${txtY[0]}
	read -n ${txtL[0]} -e txtValue[0]
	nextText
}

# Va al siguiente textbox y lo borra
function nextText {
	txtI=$(num++ $txtI)
	if test $txtI -lt ${#txtX[@]}; then
		fontColor ${txtColor[0]} ${txtColor[1]}
		goto ${txtX[$txtI]} ${txtY[$txtI]}
		for i in $(seq ${txtL[0]}); do echo -n " "; done
		goto ${txtX[$txtI]} ${txtY[$txtI]}
		read -n ${txtL[$txtI]} -e txtValue[$txtI]
		nextText
	else
		txtI=$(num-- $txtI)
	fi
}
