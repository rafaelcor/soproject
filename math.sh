#!/bin/bash

# Funcion basica de contador
function num++ {
	echo $(expr $1 + 1)
}
