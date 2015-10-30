#!/bin/bash

function checkLogin(){
	userAndPass=$1_$2
	toCompare=$(cat data/users.table | grep -w "$1_$2")
	if test $userAndPass = $toCompare 2>/dev/null;then
		loginReturn=1
	else
		loginReturn=0
	fi

}
