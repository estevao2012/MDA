#!/bin/bash

category=`find questions/* -size +0 | shuf -n 1` # Randomly draw a non-exhausted category
echo -n "Was the category \"${category#*/}\" already picked by the student? (y/N) "
read -n 1 answer		# Read a character from the standard input
if [ "$answer" = "y" ]
then
    echo
    $0				# Recursive call of the script
else
    nbOfRemainingQuestions=`wc -l < "$category"`
    let "questionNb = $RANDOM % $nbOfRemainingQuestions + 1" # Randomly draw a number beween 1 and $nbOfRemainingQuestions
    sed -n ${questionNb}p "$category"
    sed -i ${questionNb}d "$category"
fi