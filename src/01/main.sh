#!/bin/bash
# chmod +x ./
# =~ сравнение с регуляркой
# -? обработка отрицательных чисел
# ^ oбозначает начало строки. 
# + - более одного вхождения
# $после плюса - поиск до конца строки
#echo "Hello World"


if [ $# -eq 0 ] || [ $# -gt 1 ]; then
	echo "Error: 1<?>2 arguments"

else 
        ./help.sh "$1"
    
fi
