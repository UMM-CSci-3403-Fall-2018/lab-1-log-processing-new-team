#!/bin/bash

path=$1
here=$(pwd) # Mark the project directory

cd $path

# Takes the failed login data and converts it to the addRow javascript line and puts it in a temp file
cat ./*/failed_login_data.txt | awk '{print $4;}' | sort | uniq -c |
    awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp_addRow.txt

# Concatenates the header, footer and temp file
$here/bin/wrap_contents.sh temp_addRow.txt $here/html_components/username_dist username_dist.html

# Removes temp file 
rm temp_addRow.txt


