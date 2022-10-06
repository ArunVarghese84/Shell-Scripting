<<doc
Name: Arun Varghese
Date: 20/09/2022 
Description: Script to print content of file from given line number to next given line number. 
Sample Input: ./print_lines.sh 5 3 myfile.txt
Sample Output: line number 5
               line number 6
               line number 7
doc

if [ $# -eq 3 ]  #checking whether there is 3 arguments in CL
then
    if [ -f  $3 ]     #Checking whether 3rd argument is a file
    then
	tot_line=`cat $3|wc -l`           #finding total number of lines
	limit=$(($1+$2))                  
	m=$(($limit-1))                  #line upto which we have to print
	    if [ $limit -lt $tot_line ]   #cheking whether there are more lines in the file than lines we need to print
	    then
		head -$m $3 | tail -$2        #printing the lines in our limit
	    else
		echo "Error: data.txt is having only 10 lines. file should have atleast 14 lines" #error if file has lesser line than ntended
    	    fi
    else
	echo "error: ivalid file" #error if no file is given
    fi
else
    echo -e "Error: arguments missing!\nUsage: ./file_filter.sh start_line upto_line filename\nFor eg. ./file_filter.sh 5 5 <file>" #error if some CL argument is missing
fi

