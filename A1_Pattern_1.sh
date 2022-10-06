#!/bin/bash

<<doc
Name: Arun Varghese
Date: 16/09/2022
Description:  Generating pattern by reading n(pattern 1)
Sample Input: 4
Sample Output:1
              1 2
              1 2 3
              1 2 3 4
doc

read -p "Enter the number: " n   #read input n from user

for i in `seq $n`      #generating row until number of inputs given using for loop            
do
    for j in `seq $i`    #generating columns until number of row is matched
    do
	echo -n "$j "     #printing value of column in each row until limit of row for generating expected output pattern
    done
    echo
done
