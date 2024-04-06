#!/bin/bash

source "help_func.sh" 

if [[ $# != 4 ]]; then 
    echo "Wrong number of parameters. Try again"
elif [[ $1 -eq $2 || $3 -eq $4 ]]; then
    echo "Wrong numbers of parameters"
    echo "The font and background colours of one column match"
    echo "Try again"
elif ! [[ $1 =~ ^[1-6]$ && $2 =~ ^[1-6]$ && $3 =~ ^[1-6]$ && $4 =~ ^[1-6]$ ]]; then
    echo "Wrong numbers of parameters. The numbers' range is 1-6"
    echo "Try again"
else 
    source "help_func.sh"
    print
fi

