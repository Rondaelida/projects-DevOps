#!/bin/bash 

. ./printerLogic.sh

function tot_num_fold {
    echo "Total number of folders (including all nested ones) = $total_number_fold"
}

function top5 {
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    du -h -- $1* | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}'
}

function tot_num_fi {
    echo "Total number of files = $total_number_file"
}

function different {
   
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $conf" 
    echo "Text files = $txt_file"  
    echo "Executable files = $exe_file"
    echo "Log files (with the extension .log) = $log_file"  
    echo "Archive files = $archive_file"  
    echo "Symbolic links = $symbolic_file" 
}

function top10_file {
   echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
	for i in {1..10}
	do
		file_path=$(find $1 -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d") 
		if ! [[ -z $file_path ]]
		then
			echo -n "$i - " #номер 
			echo -n "$(echo $file_path | awk '{print $2}'), " # путь к файлу
			echo -n "$(echo $file_path | awk '{print $1}'), " # размер файла 
			echo "$(echo $file_path | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" # расширение файла 
		fi
	done
}

function top10_exe {
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    for i in {1..10}
    do
        file_path=$(find $1 -type f -exec du -ah {} + | sort -rh | head -10) 
        if ! [[ -z $file_path ]]
		then
			echo -n "$i - "
			echo -n "$(echo $file_path | awk '{print $2}'), " # путь
			echo -n "$(echo $file_path | awk '{print $1}'), " # зармер
			echo "$(echo $file_path | grep -o -E "\.[^/.]+$" | awk -F . '{print $2}')" # расширение 
		fi
	done
}

function time_l {
    end_t=$(date +%s.%N)
    runtime=$(echo "$end_time $start_time" | awk '{printf "%.1lf", $1-$2}')
    echo "Script execution time (in seconds) = $runtime"
}