#!/bin/bash 

<<doc
Name: Arun Varghese
Date: 19/09/2022
Description: Program for Arithmetic calculator using command line argument
Sample Input: 25 + 41
Sample Output: 25 + 41 = 66
doc


if [ $# -gt 0 ] #check whether any arguments are given on the CL
then
    if [ $# -eq 3 ]  #Check whether 3 arguments are given on the CL
    then
	echo -n "$1 $2 $3 = "
	case $2 in         #Checking different arithmetic cases
	    +)
		echo " $1 $2 $3 " | bc  #addition operation
		;;
	    -) 
		echo " $1 $2 $3 " | bc    #subtraction operation
		;;
	    x)
		echo " $1 * $3 " | bc    #multiplication operation
		;;
	    /)
		echo " scale=2 ; $1 $2 $3 " | bc #division operation
		;;
	esac
    else
	echo -e "Error:Please pass 3 arguments.\nUsage:./arithmatic_calc.sh 2.3 + 6.7"        #message for user to input arguments in CL
    fi
else
    echo -e "Error : Please pass the arguments through command line.\nUsage:./arithmatic_calc.sh 2.3 + 6.7"
fi

