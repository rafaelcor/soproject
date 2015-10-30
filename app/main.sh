#!/bin/bash

# Importar el importador xD
source ./import.sh

defTermColor 4 7
defaultColor
clear

loadForm index

firstText

firstButton
while test 1=1; do #while true-sama
	if test ${txtValue[$txtI-1]} -eq ${txtValue[$txtI-1]} 2>/dev/null; then
		controlButton s w
	else
		firstText
		
	fi
done

goto 80 80
read -n 1

