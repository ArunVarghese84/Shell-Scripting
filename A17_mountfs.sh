#!/bin/bash

<<doc
Name: Arun Varghese
Date: 26/09/2022 
Description: script to determine whether a given file system or mount point is mounted
Sample Input:
Sample Output:
doc


if [ $# -gt 0 ]
then
    file_sys=(`df | tr -s " " | cut -d " " -f1`)
    avail_space=(`df | tr -s " " | cut -d " " -f4`)
    use=(`df | tr -s " " | cut -d " " -f5`)
    mount=(`df | tr -s " " | cut -d " " -f6`)
    flag=0
    len=${#file_sys[@]}
    length=$(($len -1))
    for i in `seq $length`
    do
	if [ $1 == ${file_sys[i]} ]
	then
	    echo "File-system ${file_sys[i]} is mounted on ${mount[i]} and it is having ${use[i]} used space with ${avail_space[i]} KB free."
	    flag=1
	fi
    done
    if [ $flag -eq 0 ]
    then
	echo "$1 is not mounted."
    fi
else
    echo "Error : Please pass the name of the file-system through command line."
fi

