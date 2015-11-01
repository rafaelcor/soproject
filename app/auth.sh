#!/bin/bash

function checkLogin {
	local userAndPass=$1_$2
	local toCompare=$(grep -w "$1_$2" data/users.table)
	if test $userAndPass = $toCompare 2>/dev/null; then
		echo 1
	else
		echo 0
	fi

}

function checkCash {
	local toCompare=$(grep "^$1" data/cash.table | cut -f 2 -d "_")
	if test $toCompare -eq 0; then
		echo 1
	else
		echo 0
	fi

}
