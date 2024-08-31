#!/bin/bash 

if [[ $# == 1 && -d $1 && "$1" =~ '/'$ ]]
then 
    . ./printer.sh
    start=$(date +%s.%N)
    tot_num_fold $1
    top5 $1
    tot_num_fi $1
    different $1
    top10_file $1
    top10_exe $1
    time_l $1
else
echo "аргументом должен быть путём"
fi
