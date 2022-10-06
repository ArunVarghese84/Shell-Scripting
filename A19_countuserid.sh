#!/bin/bash

<<doc
Name: Arun Varghese
Date: 26/09/2022
Description: Count the number of users with user IDs between given range.
Sample Input:
Sample Output:
doc

user_id=(`cat /etc/passwd | cut -d ":" -f3`)
count=0
if [ $# -ne 0 ]
then
    if [ $# -eq 2 ]
    then
	if [ $2 -gt $1 ]
	then
	    for i in ${user_id[@]}
	    do
		if [ $i -gt $1 -a $i -lt $2 ]
		then
		    count=$(($count+1))
	    fi
	done
	echo "Total count of user ID between $1 to $2 is : $count"
    else
	echo "Error : Invalid range. Please enter the valid range through CL"
    fi
else
    echo -e "Error : Please pass 2 arguments through CL.\nUsage : ./user_ids.sh 100 200"
fi
else
    for i in ${user_id[@]}
    do 
	if [ $i -gt 500 -a $i -lt 10000 ]
	then
	    count=$(($count+1))
	fi
    done
    echo "Total count of user ID between 500 to 10000 is: $count"
fi


