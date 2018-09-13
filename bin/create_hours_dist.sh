#!/bin/bash

path=$1
here=$(pwd) # Mark the project directory

cd $path

# Take the hours data from failed logins and convert it into addRow javascript lines
cat ./*/failed_login_data.txt | awk '{print $3;}' | sort | uniq -c |
    awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp_addRow.txt

# Concatenates the header, footer, and temp file
$here/bin/wrap_contents.sh temp_addRow.txt $here/html_components/hours_dist hours_dist.html

# Removes temp file 
rm temp_addRow.txt
