#!/bin/bash

# Capture locations of places
here=$(pwd)
temp_dir=$(mktemp -d)

cd $temp_dir

# Take the input arguments and unzip them in the temp directory 
for input_args in "$@"
do
	archive_name="$(basename $input_args '.tgz')"
	mkdir $archive_name
	tar -xzf $here/$input_args -C $archive_name
       	$here/bin/process_client_logs.sh $archive_name
done

cd $here

# Run the scripts to create the failed login summary report
./bin/create_username_dist.sh $temp_dir
./bin/create_hours_dist.sh $temp_dir
./bin/create_country_dist.sh $temp_dir
./bin/assemble_report.sh $temp_dir

# Move the report from the temp directory to the project directory
mv $temp_dir/failed_login_summary.html $here

# Remove temp directory 
rm -rf $temp_dir
    
