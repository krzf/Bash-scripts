#!/bin/bash
function sys {


HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4, $5}')
USER=$(whoami)
OS=$(lsb_release -ds)
DATE=$(date +"%d %B %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I)
MASK=$(ip a | grep  inet -m1 | awk '{print $2}')
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free -m | awk 'NR==2{printf "%.3f GB\n", $2/1024}')
RAM_USED=$(free -m | awk 'NR==2{printf "%.3f GB\n", $3/1024}')
RAM_FREE=$(free -m | awk 'NR==2{printf "%.3f GB\n", $4/1024}')
SPACE_ROOT=$(df -k /root | awk 'NR==2{printf "%.2f MB\n", ($2 / 1024)}')
SPACE_ROOT_USED=$(df -k /root | awk 'NR==2{printf "%.2f MB\n", ($3 / 1024)}')
SPACE_ROOT_FREE=$(df -k /root | awk 'NR==2{printf "%.2f MB\n", ($4 / 1024)}')


echo -e "${bg_arg1}${font_arg1}HOSTNAME\e[0m = ${bg_arg2}${font_arg2}$HOSTNAME\e[0m"
echo -e "${bg_arg1}${font_arg1}TIMEZONE\e[0m = ${bg_arg2}${font_arg2}$TIMEZONE\e[0m"
echo -e "${bg_arg1}${font_arg1}USER\e[0m = ${bg_arg2}${font_arg2}$USER\e[0m"
echo -e "${bg_arg1}${font_arg1}OS\e[0m = ${bg_arg2}${font_arg2}$OS\e[0m"
echo -e "${bg_arg1}${font_arg1}DATE\e[0m = ${bg_arg2}${font_arg2}$(date +'%d %b %Y %T')\e[0m"
echo -e "${bg_arg1}${font_arg1}UPTIME\e[0m = ${bg_arg2}${font_arg2}$(uptime -p)\e[0m"
echo -e "${bg_arg1}${font_arg1}UPTIME_SEC\e[0m = ${bg_arg2}${font_arg2}$(cat /proc/uptime | awk '{print $1}')\e[0m"
echo -e "${bg_arg1}${font_arg1}IP\e[0m = ${bg_arg2}${font_arg2}$IP\e[0m"
echo -e "${bg_arg1}${font_arg1}MASK\e[0m = ${bg_arg2}${font_arg2}$MASK\e[0m"
echo -e "${bg_arg1}${font_arg1}GATEWAY\e[0m = ${bg_arg2}${font_arg2}$GATEWAY\e[0m"
echo -e "${bg_arg1}${font_arg1}RAM_TOTAL\e[0m = ${bg_arg2}${font_arg2}$RAM_TOTAL GB\e[0m"
echo -e "${bg_arg1}${font_arg1}RAM_USED\e[0m = ${bg_arg2}${font_arg2}$RAM_USED GB\e[0m"
echo -e "${bg_arg1}${font_arg1}RAM_FREE\e[0m = ${bg_arg2}${font_arg2}$RAM_FREE GB\e[0m"
echo -e "${bg_arg1}${font_arg1}SPACE_ROOT\e[0m = ${bg_arg2}${font_arg2}$SPACE_ROOT MB\e[0m"
echo -e "${bg_arg1}${font_arg1}SPACE_ROOT_USED\e[0m = ${bg_arg2}${font_arg2}$SPACE_ROOT_USED MB\e[0m"
echo -e "${bg_arg1}${font_arg1}SPACE_ROOT_FREE\e[0m = ${bg_arg2}${font_arg2}$SPACE_ROOT_FREE MB\e[0m"

}


