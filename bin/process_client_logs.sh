#!/bin/bash

path=$1

cd $path

# Finds the lines that have the failed password. Depending on what the failed password line contains, it's going to filter out the noise and put it in a failed_login_data file.  
grep -hr "Failed password for" * | awk '{
if ($9 =="invalid")
   print $1,$2,substr($3,0,2),$11,$13;
else
   print $1,$2,substr($3,0,2),$9,$11;
}' > failed_login_data.txt

