<<doc
Name: Arun Varghese
Date:21/09/2022 
Description: script to perform arithmetic operaton on digits of a given number
Sample Input:./operator_dependent.sh 1234+
Sample Output: Sum of digits = 10
doc

if [ $# -gt 0 ]  #checking whetherarguments are passed on cl
then
    num=$1                   #argument is set to a variable num
    op=${num: -1}              #seperating operator in the variable
    limit=$((${#num}-2))        #setting a limit for loops
    case $op in              #checking operator with each case of + - / x
	+)
	    sum=0
	    for i in `seq 0 1 $limit`
	    do
		a=${num:$i:1}    #each digits assigned using loop
		sum=$(($sum + $a))             #summing
	    done
	    echo "Sum of digits = $sum"
	    ;;
	-)
	    sub=${num:0:1}        #first digit on variable
	    for j in `seq $limit`
	    do
		b=${num:j:1}       #all other digits one by one
		sub=$(($sub-$b))     #subtracting
	    done
	    echo "Subtraction of digits = $sub"     #printing difference
	    ;;
	/)
	    div=${num:0:1}                  #first digit
	    for k in `seq $limit`
	    do
		c=${num:k:1}
		echo -n "Division of digits = "    
	       	echo " scale=2; $div/$c" | bc         #division upto 2 decimal points
	    done
	    ;;	
	x)
	    mul=${num:0:1}                          #first digit
	    for l in `seq $limit`
	    do
		d=${num:l:1}
		mul=$(($mul*$d))                   #multiplying
	    done
	    echo "Multiplication of digits = $mul"      #printing multiplied result
	    ;; 
	*)
	    echo "Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)" #if operator is missing in argument
	    ;;
    esac
else
    echo -e "Error : Please pass the arguments through CL.\nUsage : ./operator_dependent.sh 2345+"   #if no arguments are passed
fi
