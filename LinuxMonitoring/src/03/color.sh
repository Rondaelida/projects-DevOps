#!/bin/bash 

#txt
case "$2" in
    "0" )
    echo -n "\033[37;1;" # white 
    ;;
    "1" )
    echo -n "\033[37;1;" # white 
    ;;
    "2" )
    echo -n "\033[31;" # red 
    ;;
    "3" )
    echo -n "\033[32;" # green 
    ;;
    "4" )
    echo -n "\033[34;" # blue 
    ;;
    "5" )
    echo -n "\033[35;" # purple 
    ;;
    "6" )
    echo -n "\033[30;" # black 
    ;;
esac

#BG
case "$1" in
    "0" )
    echo -n "107" # white 
    ;;
    "1" )
    echo -n "107" # white 
    ;;
    "2" )
    echo -n "41" # red
    ;;
    "3" )
    echo -n "42" # green 
    ;;
    "4" )
    echo -n "44" # blue
    ;;
    "5" )
    echo -n "45" # purple 
    ;;
    "6" )
    echo -n "40" # black 
    ;;
esac
echo -n "m "

#TXT
case "$4" in
    "0" )
    echo -n "\033[37;1;" # white 
    ;;
    "1" )
    echo -n "\033[37;1;" # white 
    ;;
    "2" )
    echo -n "\033[31;" # red tet
    ;;
    "3" )
    echo -n "\033[32;" # green 
    ;;
    "4" )
    echo -n "\033[34;" # blue 
    ;;
    "5" )
    echo -n "\033[35;" # purple 
    ;;
    "6" )
    echo -n "\033[30;" # black 
    ;;
esac

#BG
case "$3" in
    "0" )
    echo -n "107" # white 
    ;;
    "1" )
    echo -n "107" # white 
    ;;
    "2" )
    echo -n "41" # red 
    ;;
    "3" )
    echo -n "42" # green 
    ;;
    "4" )
    echo -n "44" # blue 
    ;;
    "5" )
    echo -n "45" # purple 
    ;;
    "6" )
    echo -n "40" # black 
    ;;
esac
echo -n "m "

echo "\033[0m "