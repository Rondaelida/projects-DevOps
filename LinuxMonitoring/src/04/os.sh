#!/bin/bash

# файл с выводом в консоль


# значения для ос 
HOST_NAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) $(date +"%Z %z")"
s_user=$USER
OS=$OSTYPE
DATE=$(date +"%d %B %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
IP=$(hostname -I | awk '{print $1}')
MASK=$(ifconfig enp0s3 | grep netmask | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free | grep Mem: | awk '{printf("%.3f GB", $2/1024/1024)}')
RAM_USED=$(free | grep Mem: | awk '{printf("%.3f GB", $3/1024/1024)}')
RAM_FREE=$(free | grep Mem: | awk '{printf("%.3f GB", $4/1024/1024)}')
SPACE_ROOT=$(df | grep /$ | awk '{printf("%.2f MB", $2/1024)}')
SPACE_ROOT_USED=$(df | grep /$ | awk '{printf("%.2f MB", $3/1024)}')
SPACE_ROOT_FREE=$(df | grep /$ | awk '{printf("%.2f MB", $4/1024)}')


#записываем значения в вид вывода 
echo -e "$1HOSTNAME$2 = $4$HOST_NAME$3"
echo -e "$1TIMEZONE$2 = $4$TIMEZONE$3"
echo -e "$1USER$2 = $4$s_user$3"
echo -e "$1OS$2 = $4$OS$3"
echo -e "$1DATE$2 = $4$DATE$3"
echo -e "$1UPTIME$2 = $4$UPTIME$3"
echo -e "$1UPTIME_SEC$2 = $4$UPTIME_SEC$3"
echo -e "$1IP$2 = $4$IP$3"
echo -e "$1MASK$2 = $4$MASK$3"
echo -e "$1GATEWAY$2 = $4$GATEWAY$3"
echo -e "$1RAM_TOTAL$2 = $4$RAM_TOTAL$3"
echo -e "$1RAM_USED$2 = $4$RAM_USED$3"
echo -e "$1RAM_FREE$2 = $4$RAM_FREE$3"
echo -e "$1SPACE_ROOT$2 = $4SPACE_ROOT$3"
echo -e "$1SPACE_ROOT_USED$2 = $4$SPACE_ROOT_USED$3"
echo -e "$1SPACE_ROOT_FREE$2 = $4$SPACE_ROOT_FREE$3"