#!/bin/bash

function is_valid {
    result=0
    if [ $1 -gt 0 ]
        then
        result=1
    fi 
    echo $result
}