#!/bin/bash

if  [[ "$1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: argument is not valid"
else 
    echo "Working: $1"
    
fi