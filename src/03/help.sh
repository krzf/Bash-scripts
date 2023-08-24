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


printf "$1$2HOSTNAME${NC} = $3$4$HOSTNAME${NC}\n"
printf "$1$2TIMEZONE${NC} = $3$4$TIMEZONE${NC}\n"
printf "$1$2OS${NC} = $3$4$OS${NC}\n"
printf "$1$2DATE${NC} = $3$4$DATE${NC}\n"
printf "$1$2UPTIME${NC} = $3$4$UPTIME${NC}\n"
printf "$1$2UPTIME_SEC${NC} = $3$4$UPTIME_SEC${NC}\n"
printf "$1$2IP${NC} = $3$4$IP${NC}\n"
printf "$1$2MASK${NC} = $3$4$MASK${NC}\n"
printf "$1$2GATEWAY${NC} = $3$4$GATEWAY${NC}\n"
printf "$1$2RAM_TOTAL${NC} = $3$4$RAM_TOTAL${NC}\n"
printf "$1$2RAM_USED${NC} = $3$4$RAM_USED${NC}\n"
printf "$1$2RAM_FREE${NC} = $3$4$RAM_FREE${NC}\n"
printf "$1$2SPACE_ROOT${NC} = $3$4$SPACE_ROOT${NC}\n"
printf "$1$2SPACE_ROOT_USED${NC} = $3$4$SPACE_ROOT_USED${NC}\n"
printf "$1$2SPACE_ROOT_FREE${NC} = $3$4$SPACE_ROOT_FREE${NC}\n"

}

