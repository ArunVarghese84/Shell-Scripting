#!/bin/bash

<<doc
Name: Arun Varghese
Date: 28/09/2022
Description: script to replace 20% lines in a C file randomly and replace it with the pattern 
Sample Input:
Sample Output:
doc

if [ $# -gt 0 ]
then
    if [ -f $1 ]
    then
	if [ -s $1 ]
	then
	    total=`wc -l $1 | cut -d " " -f1`
	    if [ $total -ge 5 ]
	    then
		per=$(($total/5))
		for i in `seq $per`
		do
		    random=`shuf -i 1-$total -n1`
		    sed -i "$random s/.*/<-----------Deleted------------>/" $1 
		done
	    fi
	else
	    echo "Error : main2.c is empty file. So can’t replace the string."
	fi
    else
	echo "Error : No such a file."
    fi
else "Error : Please pass the file name through command line"
fi
