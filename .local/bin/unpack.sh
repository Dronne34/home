#!/bin/bash

# Joshua Packard 5/3/2016

# This script is designed to watch a directory and unpack archives to the directory that contains
# the archives. This script will match various file extensions (per the grep command below) and
# pass the files to the `unp` command which handles unpacking various archive types. The archive 
# will automatically be deleted if the script succeeds.

# Prerequisites for this script:
#
# Debian
# sudo apt-get install unp unrar-free
# 
# Centos
# sudo yum install unp unrar-free

# Example Cronjob to run this script
#
# * * * * * /path/to/script /path/to/directory 2&>> /path/to/logfile
# * * * * * /root/unpack.sh /data/movies 2&>> /root/unpack.log
#
# The example above will run the script downloaded to /root/unpack.sh and work out of the directory
# /data/movies and extract archives there and delete the archive if successful. The output of the
# script will be appended to a log file located at /root/unpack.log


# Get the name of the folder to search. This should be an absolute path. Matches fieltypes below
if [ -n "$1" ]; then
	cd $1;
	FILES=`ls | grep -E ".tar$|.tar.gz$|.rar$|.zip$|.7z$|.bzip2$"`
else
	echo "No Folder Specified."
	exit;
fi

# Loop over the files matched
for f in $FILES
do
	echo "Processing $f"

	# Get the time difference
	TIME=`date -r $f +%s`
	NOW=`date +%s`
	DIFF=$((NOW-TIME))
	echo "$DIFF seconds since last modification"

	# If the difference is more than 15 seconds, unpackage the file
	if [ "$DIFF" -gt 15 ]; then
	
		OUTPUT=`unp $f`
		
		# Get return status for the unpack command
		if [ "$?" -eq 0 ]; then
	
			# If successful, delete the file
			echo "Unpacking $f was successful. Deleting archive."
			`rm $f`
		else
			# Otherwise notify a failure
			echo "Failed to unpack $f."
		fi
	else
		echo "Skipping file for recent modification"
	fi
	
	echo "========================================================================"
	
done