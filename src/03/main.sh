#!/bin/bash

. ./help.sh



    if [[ $# -ne 4 ]]
    then
    echo -e "\e[1;31mError: wrong params. Try again with 4 params"
    exit
else
    color="^[1-6]$"
	if ! [[ $1 =~ $color && $2 =~ $color && $3 =~ $color && $4 =~ $color ]]
	then
		echo -e "\e[1;31mError:wrong params, it must be numbers from 1 to 6\n\e[1;34mlike: ./main.sh 1 2 3 4\e[0m\ntry again..."
		exit
	else
		if [[ $1 == $2 || $3 == $4 ]]
		then
		echo -e "\e[1;31mError:wrong params, font and background colors must be different \n\e[1;36mlike: ./main.sh 1 3 4 5\e[0m\ntry again..."
		exit
		fi
	fi
fi

fcolors=("\e[1;37" "\e[0;31m" "\e[0;32m" "\e[0;34m" "\e[0;35m" "\e[0;30m")
bcolors=("\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
NC='\e[0m' #defolt col
    sys "${fcolors[$2-1]}" "${bcolors[$1-1]}" "${fcolors[$4-1]}" "${bcolors[$3-1]}"
    
    