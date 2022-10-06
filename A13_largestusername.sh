#!/bin/bash

<<doc
Name: Arun Varghese
Date: 26/09/2022
Description: 
Sample Input:
Sample Output:
doc

arr=(`cat /etc/passwd | cut -d ":" -f1`)
large=${arr[0]}
small=${arr[0]}
len=$((${#arr[@]}-1))
for i in `seq $len`
do
    if [ ${#arr[$i]} -gt ${#large} ]
    then
	large=${arr[$i]}
    fi
done
echo "The Longest Name is: $large"
for j in `seq $len`
do
    if [ ${#arr[$j]} -lt ${#small} ] 
    then
	small=${arr[$j]}
    fi
done
echo "The Shortest Name is: $small"


