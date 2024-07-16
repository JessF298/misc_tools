#!/bin/bash

###################################################################
#Script Name:reverse_complement.sh
#Description:reverse complement a given DNA sequence and print to stdout.
#Last modified: 2023-04-19
#Args:#$1 the sequence to be reversed
#Author:Jess Friedersdorff
###################################################################


if [ "$#" -ne 1 ]; then
    echo "reversecomp.bash - a generic script to reverse complement given sequence."
    echo "Usage: enter sequence to be reversed."
    echo "reversecomp.bash <seq>"
else
    echo $1 | grep '^[ATCG]' | rev | tr 'ATCG' 'TAGC'
fi 