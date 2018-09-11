#!/bin/bash

path=$1

cd $path

cat failed_login_data.txt | awk '{print $4;}' | sort | uniq -c |
    awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > uniq_test.txt
