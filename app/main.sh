#!/bin/bash

# Importar el importador xD
source ./import.sh

defTermColor 4 7
defaultColor
clear

loadForm index

firstText

firstButton
c=1
while test $c=1; do #while true-sama
	if test ${txtValue[$(num-- $txtI)]} -eq ${txtValue[$(num-- $txtI)]} 2>/dev/null; then
		controlButton s w
	else
		firstText
	fi
done

goto 80 80
read -n 1

