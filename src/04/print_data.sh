#!/bin/bash

# source main.sh
# source help_func.sh


function data_collect {   
    HOSTNAME=$HOSTNAME
    TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')
    USER=$USER
    OS=$(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')
    DATE=$(date | awk '{print $2, $3, $4, $5}')
    UPTIME=$(uptime -p | awk '{print $2, $3, $4, $5}')
    UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
    IP=$(ip a | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -f1 -d'/' | head -1)
    MASK=$(ipcalc $IP | grep "Netmask" | awk '{print $2}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    RAM_TOTAL=$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')
    RAM_USED=$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')
    RAM_FREE=$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')
    SPACE_ROOT_USED=$(df /root/ | awk '/\// {printf "%.2f MB", $3/1024}')
    SPACE_ROOT_FREE=$(df /root/ | awk '/\// {printf "%.2f MB", $4/1024}')
}


print () {
    echo -e "${bc_color_val1}${font_color_val1}HOSTNAME${no_color} = ${bc_color_val2}${font_color_val2}$HOSTNAME${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}TIMEZONE${no_color} = ${bc_color_val2}${font_color_val2}$TIMEZONE${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}USER${no_color} = ${bc_color_val2}${font_color_val2}$USER${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}OS${no_color} = ${bc_color_val2}${font_color_val2}$OS${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}DATE${no_color} = ${bc_color_val2}${font_color_val2}$DATE${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}UPTIME${no_color} = ${bc_color_val2}${font_color_val2}$UPTIME${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}UPTIME_SEC${no_color} = ${bc_color_val2}${font_color_val2}$UPTIME_SEC${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}IP${no_color} = ${bc_color_val2}${font_color_val2}$IP${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}MASK${no_color} = ${bc_color_val2}${font_color_val2}$MASK${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}GATEWAY${no_color} = ${bc_color_val2}${font_color_val2}$GATEWAY${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}RAM_TOTAL${no_color} = ${bc_color_val2}${font_color_val2}$RAM_TOTAL${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}RAM_USED${no_color} = ${bc_color_val2}${font_color_val2}$RAM_USED${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}RAM_FREE${no_color} = ${bc_color_val2}${font_color_val2}$RAM_FREE${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}SPACE_ROOT${no_color} = ${bc_color_val2}${font_color_val2}$SPACE_ROOT${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}SPACE_ROOT_USED${no_color} = ${bc_color_val2}${font_color_val2}$SPACE_ROOT_USED${no_color}"
	echo -e "${bc_color_val1}${font_color_val1}SPACE_ROOT_FREE${no_color} = ${bc_color_val2}${font_color_val2}$SPACE_ROOT_FREE${no_color}"
}



color_names[1]=white
color_names[2]=red
color_names[3]=green
color_names[4]=blue
color_names[5]=purple
color_names[6]=black




function print_color_names {
    for (( i = 0; i < 2; i++ )) 
    do 
        echo -n "Column $((i+1)) background = "
        if ! [[ ${set_color[($i*2)]} -eq  ${default_color[($i*2)]} ]]; then
            echo "${set_color[$i*2]}" "(${color_names[${set_color[$i*2]}]})"

        else
            echo "default" "(${color_names[${set_color[$i*2]}]})"
        fi

        echo -n "Column $((i+1)) font color = "
        if ! [[ ${set_color[($i*2+1)]} -eq  ${default_color[($i*2+1)]} ]]; then
            echo "${set_color[$i*2+1]}" "(${color_names[${set_color[$i*2+1]}]})"

        else
            echo "default" "(${color_names[${set_color[$i*2+1]}]})"
        fi

    done
}

