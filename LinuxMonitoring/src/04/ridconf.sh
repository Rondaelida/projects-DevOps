#!/bin/bash 

# файл который читает с конфига строки и вырезает цифровое значение

    p1=$(cat config | grep "column1_background=" | cut -c 20)
    p2=$(cat config | grep "column1_font_color=" | cut -c 20)
    p3=$(cat config | grep "column2_background=" | cut -c 20)
    p4=$(cat config | grep "column2_font_color=" | cut -c 20)
    
if [[ "$p1" == "$p3" || "$p2" == "$p4" ]]; then
        echo "incorrect input"
    else
    if ! [[ $p1 =~ [1-6] ]]; then
        p1=0
    fi

    if ! [[ $p2 =~ [1-6] ]]; then
        p2=0
    fi

    if ! [[ $p3 =~ [1-6] ]]; then
        p3=0
    fi

    if ! [[ $p4 =~ [1-6] ]]; then
        p4=0
    fi
        echo $p1 $p2 $p3 $p4
    fi