#!/bin/bash

. ./check.sh

. ./help.sh

    check=$(is_valid $#)

    if [[ $check -eq 1 ]]
    then
    echo "Error: wrong parameters"
else
    sys
    check=$(logask)
    if [[ $check -eq 0 ]]
        then
        echo "Not created"
    else
        
        logwrite
    fi
fi