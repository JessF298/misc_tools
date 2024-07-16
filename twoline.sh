#!/bin/bash

###################################################################
#Script Name:twoline.sh
#Description:make a fasta file two lines per sequence. 
#Last modified: 2023-04-19
#Args: 
#	$1 = input file Name
#Author:Jess Friedersdorff
###################################################################

if [ "$#" -ne 1 ]; then
     echo "twoline.sh - a generic script to change a FASTA file with one line per sequence to a FASTA file with two lines per sequence."
     echo "Please make sure there are no %s in the file to be changed."
     echo ""
     echo "To use:"
     echo "twoline.sh <filename> "
else

    cat <"$1" | sed 's/^>/\%>/g' | sed '/>/s/$/%/g' | tr -d '\n' | tr '\%' '\n' | sed '1d'
fi 