#!/bin/bash

path=$1

cd $path

touch failed_login_data.txt

grep -r "Failed password" *.txt | awk '{print $1,$2,$3,$11,$13;}'

