#!/bin/bash

<<doc
Name: Arun Varghese
Date: 22/09/2022
Description: script called say_hello, which will print greetings based on time
Sample Input:#while opening terminal at morning,10'o clock 
Sample Output:Good Morning user, Have nice day!
              This is Thursday 08 in June of 2017 (10:44:10 AM)
doc


hour=`date +%H | cut -d " " -f4 | cut -d ":" -f1`          #the hour of time is found and initialized to a variable hour
user=`whoami`                                               #to later print username in message using `whoami` command
d1=`date | cut -d " " -f 1-4`                                  #to later print date till year using the first part of 'date' command
d2=`date | cut -d " " -f 5-6`                    #to later print exact time inside a bracket as continuation to date using 'date' command


if [ $hour -gt 5 -a $hour -le 12 ]                                            #checking the hour of time       
then
    echo -e "Good morning $user, Have nice day!\nThis is $d1 ($d2)"             #message according to hour of time
elif [ $hour -gt 12 -a $hour -le 14 ]
then
    echo -e "Good noon $user, Have nice day!\nThis is $d1 ($d2)"
elif [ $hour -gt 14 -a $hour -le 17 ]
then
    echo -e "Good afternoon $user, Have nice day!\nThis is $d1 ($d2)"
elif [ $hour -gt 17 -a $hour -le 21 ]
then
    echo -e "Good evening $user, Have nice day!\nThis is $d1 ($d2)"
elif [ $hour -gt 21 -a $hour -le 5 ]
then
    echo -e "Good night $user, Have nice day!\nThis is $d1 ($d2)"
fi

#program to be saved in .bashrc file for printing the message in shell as soon as the user logs in



