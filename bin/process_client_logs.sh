#!/bin/bash

path=$1

cd $path

touch failed_login_data.txt

grep -hr "Failed password for" * | awk '{
if ($9 =="invalid")
   print $1,$2,substr($3,0,2),$11,$13;
else
   print $1,$2,substr($3,0,2),$9,$11;
}' > failed_login_data.txt

