#!/bin/bash

path=$1
here=$(pwd) # Mark the project directory

cd $path

# Map the ip address from each failed login to a country and convert it into addRow javascript lines
join -o 2.2 <(cat ./*/failed_login_data.txt | awk '{print $5;}' | sort) <(sort $here/etc/country_IP_map.txt) | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp_addRow.txt

# Concatenates the header, footer, and temp file
$here/bin/wrap_contents.sh temp_addRow.txt $here/html_components/country_dist country_dist.html

# Removes temp file 
rm temp_addRow.txt
