#!/bin/bash

#Sanity check to exit program with error if user does not specify input file on command line
if [ $# != 1 ]; then
        echo "Usage: Please specify fasta input on command line"
        exit
fi

#Sanity check to see if the file inputed on the command line exists
if [ -e "$1" ]; then
	echo "File exists"
else
    echo "File does not exist"
fi

#Assign variables for the total number of sequences and for the sequences themselves.
#Make sure to use $1, this will use the filename inputted into the command line.
SequenceCount=(`grep '>' $1 | wc -l`) 
sequences=(`grep -v '>' $1`)
echo "$SequenceCount"


#Create a new file GCcount.txt and print two columns into it for Sequence Name and GC Percentage
touch GCcount.txt
echo "Sequence Name" "	" "GC Percentage" > GCcount.txt 

#Create a for loop that will run through each sequence and have it run through the same number of times as there are sequences. 
for ((c=0; c<$SequenceCount; c++))

do

#Assign variables to the number of G and C in each sequence. 
#Use -o in grep for only G/C. Use -m with wc to get the character count. 
countG=`echo ${sequences[$c]} | grep -o "G" | wc -l`
countC=`echo ${sequences[$c]} | grep -o "C" | wc -l`

#Assign a variable for just the names of the sequences
Sequencenames=(`grep '>' $1`)

#Assign variables for the total number of characters in the sequences.
#Assign a variable for the addition of the number of G's plus the number of C's
#Assign a variable for the percent calculation 
#Echo the sequence names and the percent on the same line and output them to GCcount.txt file. Do not override this file. 
total=`echo "${sequences[$c]}" | wc -m`	
countGC=`expr $countG + $countC`
percent=`echo "scale=2 ; ($countGC/$total)" | bc`
echo "${Sequencenames[$c]}	 $percent" >> GCcount.txt
	
done


