#!/bin/bash

# TODO: create a new file abc.log also when only abc.log.3 exists

# get files in reverse order
filenames=`ls -r *.log*`

# iterate through all the filenames
for f in $filenames
do
	# if the file ends .log rename it .log.1 and create new file with .log
	if [[ $f == *".log" ]];
	then
		# rename	
		mv $f $f.1
		# create new file
		touch $f
	fi

	# if the file ends .log.* increase its number count and create new file with .log
	if [[ $f == *".log."* ]];
	then
		# get numeric ending part of the file	
		nums=$(echo $f | cut -d '.' -f3)
		# get the file name with .log extension
		base_name=$(echo $f | cut -d '.' -f1,2)
		# increment the count
		nums=$((nums+1))
		# rename the file
		mv $f $base_name.$nums
	fi
done