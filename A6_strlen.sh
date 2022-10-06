<<doc
Name: Arun Varghese
Date: 20/09/2022 
Description: Program to find length of each and every string
Sample Input: ./string_length.sh hello hai how are you?
Sample Output: Length of string (hello) - 5
               Length of string (hai) - 3
               Length of string (how) - 3
               Length of string (are) - 3
               Length of string (you?) - 4
doc



array=($@)                                   #storing every command line argument into an array
index=0                                        #index of array elements set on zero

if [ $# -gt 0 ]                                                #checking whether any CL arguments are passes
then
for i in array[$@]                                        #checking every argument using a loop
do
    length=${#array[index]}                                 #checking the length of each argument
    echo "length of string (${array[index]}) - $length "          #printing the length
    index=$(($index+1))                                     #appending the index for checking next argument
done
else
    echo "Error : Please pass the arguments through command-line."       #if no argument is passes
fi


