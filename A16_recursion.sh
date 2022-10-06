#!/bin/bash

<<doc
Name: Arun Varghese
Date: 22/09/2022
Description: script use a recursive function to print each argument passed to the function
Sample Input:./recursion.sh How are you? I am fine
Sample Output:How
              are
              you?
              I
              am
              fine
doc

function rec   #defining functio rec
{ 
    echo $1     #printing arguments on each call
    arr=($@)        #assigning CLA to an Array
    if [ ${#arr[*]} -gt 1 ]    #checking whether array has contents on it 
    then
	arr=(${arr[@]:1})   #eliminating first variable from each and saving rest to array
	rec ${arr[@]}          #calling function recursively 
    else
	return
    fi
}
if [ $# -gt 0 ]      #checking whether arguments are passed or not
then
    rec $@               #calling function
else
    echo "Error : Pass the arguments through command line" #if argumemts are not passed
fi

