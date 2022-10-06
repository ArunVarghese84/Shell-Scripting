#!/bin/bash

<<doc
Name: Arun Varghese
Date: 23/09/2022 
Description: Shell script to convert string lower to upper and upper to lower
Sample Input: ./upper_lower.sh file.txt
Sample Output: 1 – Lower to upper
2 – Upper to lower
Please select option : 1
                       WHAT IS OS?
                       WHAT ARE THE DIFFERENT OS?
                       WHEN IS OS USED?
                       WHAT IS PARTITION AND ITS USE?
                       HOW MANY PARTITIONS CAN BE DONE?
doc

if [ $# -gt 0 ]         #checking whether CLA passed or not
then
    if [ -f $1 ]          #checking whether the argument passed is a file
    then
	if [ -s $1 ]         #if file checking whether it has some content in it
	then
	    echo -e "1 – Lower to upper\n2 – Upper to lower"      #passing options to user
	    read -p "PLease select option:" opt                         #reading option from user
	    case $opt in                                            #program according to the option selected
		1)
		   cat $1 | tr a-z A-Z                   #if 1 is selected converting lowercase to upper
		   ;;
	       2)
		   cat $1 | tr A-Z a-z                   #if option 2 is selected converting upper to lowe
		   ;;
	       *)
		   echo "invalid entry"                        #if not both, invalid entry
		   ;;
	   esac
       else
	   echo "Error: No contents inside the file."         #if file has no contents in it
	fi
    else
	echo "Error: The input is not a file"                 #if the input is not a file
    fi
else
    echo "Error : Please pass the file name through command line."             #if argument is not passed on CL
fi

