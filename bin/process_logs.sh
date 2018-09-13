#!/bin/bash

here=$(pwd)
temp_dir=$(mktemp -d)

for input_args in "$@"
do
    tar -xzf $input_args
    archive_name=$(basename $input_args ".tgz")
    ./bin/process_client_logs.sh $temp_dir/$archive_name
done

./bin/create_username_dist.sh $temp_dir
./bin/create_hours_dist.sh $temp_dir
./bin/create_country_dist.sh $temp_dir
./bin/assemble_reports.sh $temp_dir

mv $temp_dir/failed_login_summary.html $here

rm -rf $temp_dir
    
