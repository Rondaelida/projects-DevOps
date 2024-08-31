#!/bin/bash

#total_num_fold
total_number_fold=$(find $1 -mindepth 1 -type d | wc -l) 

#total_num_file 
total_number_file=$(find $1 -type f | wc -l)

#dif
conf=$(find $1 -type f -name "*.conf" | wc -l)
txt_file=$(find $1 -type f -exec file {} + | grep -i "text" | wc -l)
exe_file=$(find $1 -type f -perm /u+x,g+x,o+x | wc -l)
log_file=$(find $1 -type f -name "*.log" | wc -l)
archive_file=$(find $1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.tar.gz" \) | wc -l)
symbolic_file=$(find $1 -type l | wc -l)
