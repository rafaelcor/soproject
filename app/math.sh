#!/bin/bash

# Funcion basica que suma 1
function num++ {
	echo $(expr $1 + 1)
}

# Funcion basica que resta 1
function num-- {
	echo $(expr $1 - 1)
}
