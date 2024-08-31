#!/bin/bash

#записываем значения в вид вывода 
function library {
    echo "HOSTNAME = $HOST_NAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $s_user"
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

# функция которая принимает ответ пользователя и записывает в текстовый файл данные 
function accept_script {
    echo -n "Записать данные о системе? (Y/N) "
    read answer
    if [ $answer == "y" ] || [ $answer == "Y" ]
    then
    
    newfile=$(date +"%d-%m-%y-%H-%M-%S")".status"
    
    echo "HOSTNAME = $HOST_NAME"  >>$newfile
    echo "TIMEZONE = $TIMEZONE" >>$newfile
    echo "USER = $s_user" >>$newfile
    echo "OS = $OS" >>$newfile
    echo "DATE = $DATE" >>$newfile
    echo "UPTIME = $UPTIME" >>$newfile
    echo "UPTIME_SEC = $UPTIME_SEC" >>$newfile
    echo "IP = $IP" >>$newfile
    echo "MASK = $MASK" >>$newfile
    echo "GATEWAY = $GATEWAY" >>$newfile
    echo "RAM_TOTAL = $RAM_TOTAL" >>$newfile
    echo "RAM_USED = $RAM_USED" >>$newfile
    echo "RAM_FREE = $RAM_FREE" >>$newfile
    echo "SPACE_ROOT = $SPACE_ROOT" >>$newfile
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED" >>$newfile
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE" >>$newfile
    
    echo "файл сохранён"
    fi
}