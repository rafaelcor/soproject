#!/bin/bash

function resetValues {
	# Color por defecto de los botones
	btnColor=(1 7 2 1)
	# Arrays que almacenan la posicion de los botones y su tamaño
	btnX=() 	# posicion en X
	btnY=() 	# posicion en y
	btnT=() 	# texto del boton
	btnI=0 		# indice del boton sleeccionado actual
	btnCb=() 	# callbacks de los botones

	# Color por defecto de los textbox
	txtColor=(7 0)
	# Arrays que almacenan la posicion de los textbox y su tamaño
	txtX=() 	# pos en x
	txtY=() 	# pos en y
	txtL=() 	# longitud del textobx (limite)
	txtI=0 		# indice del boton seleccionado actual
	txtValue=() 	# valor almacenado en el textbox
}

resetValues

# Define el color de los botones
function defBtnColor {
	btnColor=($1 $2 $3 $4)
}
# Crea un nuevo boton
function button {
	goto $2 $3
	fontColor ${btnColor[0]} ${btnColor[1]}			
	local label="<"$1">"
	echo -n $label | sed "s/_/ /g"

	btnX+=($2)
	btnY+=($3)
	btnT+=($label)
	btnCb+=($4)

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
	resetValues
	cat form/$1.form
	source ./form/$1.sh
	source ./form/$1_cb.sh
	#firstButton
}

# Va al primer textbox y lo borra
function firstText {
	txtI=0
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
		for i in $(seq ${txtL[$txtI]}); do echo -n " "; done
		goto ${txtX[$txtI]} ${txtY[$txtI]}
		read -n ${txtL[$txtI]} -e txtValue[$txtI]
		nextText
	else
		txtI=$(num-- $txtI)
	fi
}

# Va al primer boton
function firstButton {
	fontColor ${btnColor[2]} ${btnColor[3]}
	goto ${btnX[0]} ${btnY[0]}
	echo -n ${btnT[0]} | sed "s/_/ /g"
	defaultColor
}

# Va al siguiente boton
function nextButton {
	btnI=$(num++ $btnI)
	if test $btnI -lt ${#btnX[@]}; then
		local anterior=$(num-- $btnI)
		fontColor ${btnColor[0]} ${btnColor[1]}
		goto ${btnX[$anterior]} ${btnY[$anterior]}
		#echo -n ${btnT[$anterior]}
		echo -n ${btnT[$anterior]} | sed "s/_/ /g"

		fontColor ${btnColor[2]} ${btnColor[3]}
		goto ${btnX[$btnI]} ${btnY[$btnI]}
		#echo -n ${btnT[$btnI]}
		echo -n ${btnT[$btnI]} | sed "s/_/ /g"		
		#nextButton
	else
		btnI=$(num-- $btnI)
	fi
}

# Va al boton anterior
function backButton {
	btnI=$(num-- $btnI)
	if test $btnI -ge 0; then
		local anterior=$(num++ $btnI)
		fontColor ${btnColor[0]} ${btnColor[1]}
		goto ${btnX[$anterior]} ${btnY[$anterior]}
		#echo -n ${btnT[$anterior]}
		echo -n ${btnT[$anterior]} | sed "s/_/ /g"

		fontColor ${btnColor[2]} ${btnColor[3]}
		goto ${btnX[$btnI]} ${btnY[$btnI]}
		#echo -n ${btnT[$btnI]}
		echo -n ${btnT[$btnI]} | sed "s/_/ /g"
		#nextButton
	else
		btnI=$(num++ $btnI)
	fi
}

function controlButton {	
	key="a"
	while test $key != "_"; do
		read_key
		if test $key = _$1; then nextButton; fi
		if test $key = _$2; then backButton; fi
	done
	#echo FUNCIONA
	${btnCb[$btnI]}
}
