#!/bin/bash

<<doc
Name: Arun Varghese
Date:19/09/2022 
Description: Program for printing a chess board
Sample Input:
Sample Output: pattern of chess board
doc

for row in `seq 8`   #eight rows 
do
    for col in `seq 8` #eight columns
    do
	num=$(($row+$col))   #sum of column and row 
	if [ $(($num%2)) -eq 0 ] #check whether the sum is odd or even
	then
	    echo -e -n "\e[47m" " "       #if even print black space
	else
	    echo -e -n "\e[40m" " "        #if odd print white space
	fi
    done
    echo -e "\e[0m" " "                    #end colours and give no color once the 8 column ends
done
