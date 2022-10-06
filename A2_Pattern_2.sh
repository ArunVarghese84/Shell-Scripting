#!bin/bash

<<doc
Name: Arun Varghese
Date: 16/09/2022
Description: pattern of number increasing from Top to Bottom (pattern2)
Sample Input:4
Sample Output:1
              2 3
              4 5 6
              7 8 9 10
doc

count=1   #enter a count to print

read -p "Enter Input:" n  #read input
for i in `seq $n`  #generate row
do
    for j in `seq $i` #generate column
    do
	echo -n "$count "   #print values in rows according to count
	count=$(($count+1)) #incrementing count for next value
    done
    echo
done


	

