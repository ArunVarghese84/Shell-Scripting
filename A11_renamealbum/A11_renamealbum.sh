#!/bin/bash

<<doc
Name: Arun Varghese
Date: 23/09/2022 
Description: Given album name and corresponding directory, this scripts renames the jpg files with new name passed through command line
Sample Input: bash rename_album.sh day_out
Sample Output: All .jpg files in current directory is renamed as
               day_out001.jpg day_out002.jpg day_out003.jpg day_out005.jpg day_out004.jpg
doc

if [ $# -gt 0 ]       #checking whether CLA is passed or not
then
    for i in `echo *.jpg`           #iterating all the .jpg files
    do
	num=`echo $i | tr -cd [:digit:]`       #initializing the digits parts of filename in a variable num
	mv $i $1$num.jpg                    #printing the new filename
    done
else
    echo "Error : Please pass the prefix name through command line."         #if arguments are not passed
fi
