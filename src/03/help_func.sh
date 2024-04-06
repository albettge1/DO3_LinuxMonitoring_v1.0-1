#!/bin/bash

# 4 parameters from 1 to 6
# 1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black
# font and background mustn't match and must be handled, suggest to try again and exit
# 1!=2 3!=4

# function data_collect {   
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
# }


background_color() {
	case $1 in
		1) echo -e '\033[107m';;
		2) echo -e '\033[41m';;
		3) echo -e '\033[42m';;
		4) echo -e '\033[44m';;
		5) echo -e '\033[45m';;
		6) echo -e '\033[40m';;
	esac
}

font_color() {
	case $1 in
		1) echo '\033[97m';;
		2) echo '\033[31m';;
		3) echo '\033[32m';;
		4) echo '\033[34m';;
		5) echo '\033[35m';;
		6) echo '\033[30m';;
	esac
}

bc_color_val1="$(background_color "$1")"
font_color_val1="$(font_color "$2")"
bc_color_val2="$(background_color "$3")"
font_color_val2="$(font_color "$4")"
no_color="\033[0m"


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
