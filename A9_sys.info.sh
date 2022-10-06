#!/bin/bash

<<doc
Name: Arun Varghese
Date: 27/09/2022
Description: script to print system information using commands
Sample Input:
Sample Output:
doc

function run()

{
    echo -e "1. Currently logged users\n2. Your shell directory\n3. Home directory\n4. OS name & version\n5. Current working directory\n6. Number of users logged in\n7. Show all available shells in your system\n8. Hard disk information\n9. CPU information.\n10. Memory Informations\n11. File system information.\n12. Currently running process."

    read -p "Enter the choice :" n
    case $n in 
	1)
	    echo -n "Currently logged users is "
	    whoami
	    ;;
	2)
	    echo "Your shell directory is " $SHELL
	    ;;
	3)
	    echo "Home directory is " $HOME
	    ;;
	4)
	    echo -n "OS name & version is "
	    uname-v
	    ;;
	5)
	    echo -n "Current working directory is " 
	    pwd
	    ;;
	6)
	    echo -n "Number of users logged in are "
	    who -q
	    ;;
	7)
	    echo -n "all available shells in your system are "
	    cat /etc/shells
	    ;;
	8)
	    echo -n "Hard disk information: "
	    hwinfo
	    ;;
	9)
	    echo -n "CPU information: "
	    cat/proc/cpuinfo
	    ;;
	10)
	    echo -n "Memory Informations: "
	    cat/proc/meminfo
	    ;;
	11)
	    echo -n "File system information."
	    df
	    ;;
	12)
	    echo -n "Currently running process is"
	    ps
	    ;;
	*)
	    echo "Error : Invalid option, please enter valid option"
	    ;;
    esac


    function choice()
    {
	read -p "Do you want to continue(y/n) ?" ch
	echo
	if [ $ch = "y" ]
	then
	    run
	else
	    return
	fi
    }
choice
}
run
