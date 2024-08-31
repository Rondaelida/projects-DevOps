#!/bin/bash

#подключаем библиотеки 
. ./chmod.sh 
. ./test.sh

# выдаём права 
rules

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

#выводим библиотеку с данными ос 
library
#запускаем скрипт с согласием
accept_script



