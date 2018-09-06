#!/bin/sh

wrapped=$1
header=$2_header.html
footer=$2_footer.html
target=$3

# Concatenate the header, the middle and the footer and output to the target file
cat $header $wrapped $footer | uniq > $target
