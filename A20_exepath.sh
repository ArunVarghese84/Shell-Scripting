#!/bin/bash

<<doc
Name: Arun Varghese
Date: 27/09/2022 
Description: For each directory in the $PATH, display the number of executable files in that directory
Sample Input:
Sample Output:
doc

total=0
for i in `echo $PATH | tr ":" " "`
do
    count=0
    if [ -d $i ]
    then
	cd $i
	for j in `ls`
	do
	    if [ -x $j ]
	    then
		count=$(($count+1))
	    fi
	done
	echo "Current dir:$i"
	echo "current count:$count"
	total=$(($total+$count))
    fi
done
echo "Total – $total"

