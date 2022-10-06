#!/bin/bash

<<doc
Name: Arun Varghese
Date: 26?09/2022 
Description: script to delete empty lines from a file
Sample Input: Contents of file.txt: (blank lines with multiple spaces)

              Hello

          

              How

               

              are


              you?

Sample Output:bash delete_empty_lines.sh file.txt
              Empty lines are deleted
              Hello
              How
              are
              you?
doc


if [ $# -gt 0 ]
then
    if [ -f $1 ]
    then
	sed -i '/^[[:blank:]]*$/d' $1
	echo "Empty lines are deleted"
	cat $1
    else
	echo "Error: invalid entry, pass a filename"
    fi
else
    echo "Error: Please pass the file name through command line."
fi
