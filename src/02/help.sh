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


echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

}

function logask {
   answer=0
    read -p "Сохранить данные в файл? Y/N: " ans

    if [[ "$ans" =~ ^[Yy]$ ]]; then
    answer=1
    fi
    echo $answer
}
   

function logwrite {
    filename="`date +%d_%m_%y_%H_%M_%S`.status"
    touch $filename
    
    for var in $(sys)
    do
       sys >> $filename
       exit 1
    done

    echo "Log created"
}