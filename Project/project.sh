#!/bin/bash

<<doc
Name: Arun Varghese
Date:30/09/2022 
Description:LS project -Command line Test Portal 
Sample Input:
Sample Output:
doc

arr=( $(cat username.csv) )  #contents of file containing usernames are stored into an array
arr1=( $(cat password.csv) ) #contents of file containing passwords are stored into an array
arr2=( $(cat organs.txt) )   #contents of file containing original answer options of each qn are stored into an array
arr3=( $(cat useranswer.txt) ) #contents of file containing answer options entered by the user are stored into an array

line_no=`wc -l QuestionBank.txt| cut -d " " -f1`
totqn=$(($line_no/5))

function totalmark               #function for calculating and printing the total marks user acquired
{
    arr3=( $(cat useranswer.txt) )
    len=$((${#arr2[@]}-1))
    l=$(($len+1))
    count=0
    for i in `seq 0 1 $len`        #marks are calculated comparing elements of files containing user entered answers and original answers
    do
	if [ ${arr2[$i]} = ${arr3[$i]} ]
	then
	    count=$(($count+1))
	fi
    done
    echo -e "\nTotal marks you have acquired in this test is: $count out of $l" #total marks are printed
}


function marks
{
    for k in `seq 3 -1 1`                #a countdown before test review appears
    do 
	echo -e -n "\r Your Test Review in :$k \c \n"
	read -t1 opt
    done
    echo
  
    m=0
    lenopt=${#arr2[@]}
    j=0
    arr3=( $(cat useranswer.txt) )
    for i in `seq 5 5 $line_no`                      #each question and its options displayed one by one
    do
	echo
	head -$i QuestionBank.txt | tail -5
	while [ $j -lt $lenopt ]                 #correct answer and the option user entered is displayed after each question and options
	do
	    m=$(($m+1))
	    echo -e "\n The correct Answer of Qn No.$m is Option: ${arr2[$j]}"
	    echo -e "\n The Answer you've entered is option: ${arr3[$j]}"
	    j=$(($j+1))
	    break
    done
done

    totalmark      #function call for function that does total mark calculation and printing
}

function taketest                  #function to run the test
{

    for i in `seq 3 -1 1`              #count down to test
    do
	echo -e -n "\r The test Begins in: $i \c \n"
	read -t1 opt
    done
    echo

    for i in `seq 5 5 $line_no`           #displaying the questions from questionbank filr
    do
	head -$i QuestionBank.txt | tail -5
	for j in `seq 10 -1 1`                         #read option from the user in given time
	do
	    echo -e -n "\r Choose Option: $j \c \n"
	    read -t1 option
	    if [ -z $option ]                        #if option is not selected a default value is assigned as option
	    then
		option=e                   
	    else
		break
	    fi
	done
	echo $option >> useranswer.txt         #the option taken is stored into a file
    done
    marks            #function call for the function handling test review 
}

function testopt                    #once signin is successfull, test option is provided
{
    echo -e "\n1] Take test \n2] Exit"
    read choice2
    case $choice2 in
	1)
	    taketest
	    ;;
	2)
	    return
	    ;;
	*)
	    return
	;;
esac
}


function signin                                             #function to sigin
{
    read -p "Enter your username " user                    #username is read from the user
    flag=0
    length=$((${#arr[@]}-1))                  
    for i in `seq 0 1 $length`                          #checking whether username matches any of the already existing usernames
    do
	if [ $user = ${arr[$i]} ]
	then
	    read -s -p "Enter your Password " pass            #if yes password is read
	    flag=1
	    userpos=$i
	fi
done
if [ $flag -eq 0 ]
	then
	    echo -e "\nNo user with this username found"          #if no user should begin from opening
	    opening
fi
if [ $pass = ${arr1[$userpos]} ]                 
then
    echo -e "\nSignup successful"             #if password matches username
    testopt                                  #test is called
else
    echo -e "\nIncorrect Password"         #if password doesnt matches the username
    signin
fi

}


function opening                            #function for the opening page of command line test
{
    echo -e "1] Sign Up\n2] Sign In\n3] Exit\n "          #printing options to signup,signin or exit
    read choice
    case $choice in                #letting user select one of those choices by using case
	1)
	    signup          #if user selects signup the function sigup is called
	    ;;
	2)
	    signin          #calling signup function on selection
	    ;;
	3)
	    return
	    ;;
	*)
	    return
	    ;;
    esac
}

function signup                            #the signup function
{
    arr=( $(cat username.csv) )             #usernames are stored in a csv file and is stored to an array arr
    read -p "Enter a user name " un      #reading new usernames from user
    sign=0
    for i in ${arr[@]}            #checking whether the user name already exist or not
    do
	if [ $un = $i ]
	then
	    sign=1
	fi
    done
    if [ $sign -eq 1 ]
    then
	echo -e "\nusername already exist"
	signup                                      #if username already exists,once again signup functio is called
    else
	password                               #else password is taken from the user, for that another function "password" is called
    fi
}

function password                      #function to take password from user
{
    read -s -p "Enter a Password" pw       #a password is read from the user
    if [ ${#pw} -ge 8 ]                #check whether the password has atleast 8 characters in it
    then
	read -s -p "           confirm password" cwp            #password is confirmed
	if [ $cwp == $pw ]
	then
	    echo -e "\nsignup successfull"                #if password matches signup is succesfull
	    echo $un >> username.csv                    #the new username and password is stored into respective csv files
	    echo $pw >> password.csv
	    opening                                   #once again opening page appears
	else
	    echo -e "\nconfirmation failure"            #if confirmation is failed, once again signup is called
	    signup
	fi
    else
	echo -e "\nenter a longest password \n atlest 8 characters"   #also if password is less in size, signup is called
	signup
    fi
}


opening                   #function call to start the test by showing opening page
