# TAYLOR_Project_2

## Calculateing GC content in a fasta file

        #!/bin/bash

Sanity check to exit program with error if user does not specify input file on command line  

         if [ $# != 1 ]; then   
              echo "Usage: Please specify fasta input on command line"    
               exit    
         fi    

Sanity check to see if the file inputed on the command line exists

        if [ -e "$1" ]; then  
	            echo "File exists"  
        else    
              echo "File does not exist"      
        fi      

Assign variables for the total number of sequences and for the sequences themselves.  
Make sure to use **$1**, this will use the filename inputted into the command line.  
**_echo_** the variable for the sequence count to make sure it's working  


Create a new file GCcount.txt using the command **_touch_** and print two columns into it for "Sequence Name" and "GC Percentage"  
Put a tab space in between the "Sequence Name" and "GC Percentage" so that it creates two columns 

        echo "Sequence Name" "	" "GC Percentage" > GCcount.txt   

Create a for loop that will run through each sequence and have it run through the same number of times as there are sequences.   

        for ((c=0; c<$SequenceCount; c++)) 


Assign variables to the number of G and C in each sequence.   
Use _-o_ in **_grep_** for only G/C. Use _-m_ with wc to get the character count. 

        countG=`echo ${sequences[$c]}` | grep -o "G" | wc -l 

Assign a variable for just the names of the sequences using **_grep_**  


Assign variables for the total number of characters in the sequences using **_echo_** and **_wc_**. Make sure to use _-m_  
Assign a variable for the addition of the number of G's plus the number of C's using **_expr_**  

        countGC=``expr $countG + $countC`

Assign a variable for the percent calculation  

        percent`=``echo "scale=2 ; ($countGC/$total)" | bc   
    
Echo the sequence names and the percent on the same line and output them to _GCcount.txt file_. **_Do not override this file._**  

       echo "${Sequencenames[$c]}	 $percent" >> GCcount.txt  
	

