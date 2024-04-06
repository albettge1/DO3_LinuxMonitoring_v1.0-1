#!bin/bash

function output {   
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = "$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')""
    echo "USER = $USER"
    echo "OS = "$(hostnamectl | grep "Operating System" | awk '{print $3, $4, $5}')""
    echo "DATE = "$(date | awk '{print $2, $3, $4, $5}')""
    echo "UPTIME = "$(uptime -p | awk '{print $2, $3, $4, $5}')""
    echo "UPTIME_SEC = "$(cat /proc/uptime | awk '{print $1}')""
    IP=$(ip a | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -f1 -d'/' | head -1)
    echo "IP = $IP"
    echo "MASK = "$(ipcalc $IP | grep "Netmask" | awk '{print $2}')""
    echo "GATEWAY = "$(ip route | grep default | awk '{print $3}')""
    echo "RAM_TOTAL = "$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')""
    echo "RAM_USED = "$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')""
    echo "RAM_FREE = "$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')""
    echo "SPACE_ROOT_USED = "$(df /root/ | awk '/\// {printf "%.2f MB", $3/1024}')""
    echo "SPACE_ROOT_FREE = "$(df /root/ | awk '/\// {printf "%.2f MB", $4/1024}')""
}

output

echo 

echo "Would you like to save the data? (Y/N): "
read answer
if [[ "$answer" == "Y" || "$answer" == "y" ]]; then 
    date=$(date "+%d_%m_%y_%H_%M_%S")
    filename="$date"
    output >> $filename
fi
