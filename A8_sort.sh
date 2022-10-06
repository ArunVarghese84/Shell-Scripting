<<doc
Name: Arun Varghese
Date: 21/09/2022
Description:sort a given number in ascending or descendig order 
Sample Input: -a 5 4 6 2 3 8 9 7 1
Sample Output: Ascending order of array is 1 2 3 4 5 6 7 8 9
doc

if [ $# -gt 0 ]
then
    if [ $1 = "-a" ]
    then
	arr=($@)
	ol=$(($#-2))
	for i in `seq $ol`
	do
	    il=$(($#-$i-1))
	    for j in `seq $il`
	    do
		if [ ${arr[j]} -gt ${arr[j+1]} ]
		then
		    temp=${arr[j]}
		    arr[j]=${arr[j+1]}
		    arr[j+1]=$temp
		fi
	    done
	done
       	echo "Ascending order of array is ${arr[@]:1} "
    elif [ $1 = "-d" ]
    then
	arr=($@)
	ol=$(($#-2))
	for i in `seq $ol`
	do
	    il=$(($#-$i-1))
	    for j in `seq $il`
	    do
		if [ ${arr[j]} -lt ${arr[j+1]} ]
		then
		    temp=${arr[j]}
		    arr[j]=${arr[j+1]}
		    arr[j+1]=$temp
		fi
	    done
	done
	echo "Descending order of array is ${arr[@]:1}"
    else
	echo -e "Error : Please pass the choice.\nUsage : ./sorting -a/-d 4 23 5 6 3"
    fi
else
    echo -e "Error : Please pass the argument through command line.\nUsage : ./sorting -a/-d 4 23 5 6 3"
fi








