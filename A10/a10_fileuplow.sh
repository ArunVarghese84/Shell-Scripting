#!/bin/bash

<<doc
Name: Arun Varghese
Date: 23/09/2022 
Description: script to rename a file/directory replaced by lower/upper case letters
Sample Input: #no input    Before running the script
                           $ ls
                           File.txt MyScript.SH MyFile007.txt dir/ Assign1/ newfolder
Sample Output: Files are rename in lowercase and directories are renamed in upper case
               $ ls
               file.txt myfile007.txt myscript.sh DIR/ ASSIGN1/ NEWFOLDER/
doc


for i in `ls`           #iterating all contents,filenames and directories
do
    if [ -f $i ]       #if content is a file
    then
	new=`echo $i | tr A-Z a-z`      #converts the file name to lowercase
	mv $i $new                        #the new filename in lowercase is permanently saved by moving it to the new name
    elif [ -d $1 ]          #if conent is directory
    then
	new=`echo $i | tr a-z A-Z`            #converting the directoies name into uppercase
	mv $i $new                              #saving permenantly
    fi
done
echo "Files are rename in lowercase and directories are renamed in upper case" #the message to user about conversion
