#!/bin/bash

# Define el color por defecto de fondo y fuente en la terminal
function defTermColor {
	term=($1 $2)
}

# Cambia el color de la fuente
function fontColor {
	tput setab $1
	tput setaf $2
}

# Aplica el color por defecto de la terminal
function defaultColor {
	fontColor ${term[*]}
}

# Coloca el cursos en una posicion determinada
function goto {
	tput cup $1 $2
}

# Leer tecla
function read_key {
	stty -echo
	read -n 1 key
	key=_$key
	stty echo
	#echo $key
}
