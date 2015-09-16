#!/bin/bash

FOLDER_BRASILEIRAO="/home/estevao/Workspace/UFMG/MDA/aula6/data/brasileirão"
TEAM="$FOLDER_BRASILEIRAO/teams.txt"


#  in teams.txt replace "Atlético" with "Atl."
#sed 's/Atlético/Atl./' "$FOLDER_BRASILEIRAO/teams.txt"

#  in teams.txt place an exclamation mark at the beginning of the lines 
#sed 's/.*Atlético/!&/' $TEAM

# Use the script teams.sed on retweets.txt
# sed -f $FOLDER_BRASILEIRAO"/teams.sed" "$FOLDER_BRASILEIRAO/retweets.txt"

# create a script sed to create a sed file to determine 
# sed 's?\([0-9]*\)    \(.*\)? s:\\([0-9] \\)\1 :\\1\2 :?' $FOLDER_BRASILEIRAO"/teams.txt" > "teams.sed"

# Find pais origem nos htmls das distros

DISTRO="/home/estevao/Workspace/UFMG/MDA/aula6/data/distrowatch_pages"

ls $DISTRO | 
while read line           
do           
    # country=$(grep -oe 'search.php?origin=\(.*\)"' $DISTRO/$line | sed -e 's:search.php?origin=::' -e 's:"::')
    # echo $country" - "$line
    grep -oe 'search.php?origin=\(.*\)"' $DISTRO/$line | sed -e 's:search.php?origin=::' -e's:": - '$line':'
done 