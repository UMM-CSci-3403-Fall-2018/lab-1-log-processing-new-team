#!/bin/bash

path=$1

# Combine the distribution files that were made earlier
cat $path/country_dist.html $path/hours_dist.html $path/username_dist.html > tmp_report.txt

# Wrap the combined report in the header and footer
./bin/wrap_contents.sh tmp_report.txt html_components/summary_plots $path/failed_login_summary.html

# Remove temp file
rm tmp_report.txt
