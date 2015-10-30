#!/bin/bash

function checkLogin {
	local userAndPass=$1_$2
	local toCompare=$(cat data/users.table | grep -w "$1_$2")
	if test $userAndPass = $toCompare 2>/dev/null;then
		echo 1
	else
		echo 0
	fi

}
