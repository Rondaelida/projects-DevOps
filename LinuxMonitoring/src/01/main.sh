#!/bin/bash
#записываем регулярное выражение 
REGEX="^[+-]?[0-9]+$"
#сравниваем с параметром если не совпадает
if [[ ! $1 =~ $REGEX ]];
then
echo $1
else
echo "incorrect parameter"
fi
