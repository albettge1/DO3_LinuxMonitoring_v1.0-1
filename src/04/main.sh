#!/bin/bash

source .conf
source help_func.sh 
source print_data.sh


if [[ -f ".conf" ]]; then
    source ".conf"
else 
    echo "The config file does not exist"
    exit 1
fi


for (( i = 0; i < 4; i++ )) 
do 
    if ! [[ ${set_color[$i]} =~ ^[1-6]$ ]]; then
        set_color[$i]=${default_color[$i]}
    fi
done



if [[ ${set_color[0]} -eq  ${set_color[1]} ]]; then
    echo "The bg color and font color match. Error"
    exit 1
elif [[ ${set_color[2]} -eq  ${set_color[3]} ]]; then
    echo "The bg color and font color match. Error"
    exit 1
fi


bc_color_val1="$(background_color "${set_color[0]}")"
font_color_val1="$(font_color "${set_color[1]}")"
bc_color_val2="$(background_color "${set_color[2]}")"
font_color_val2="$(font_color "${set_color[3]}")"
no_color="\033[0m"


data_collect
print
echo
print_color_names 