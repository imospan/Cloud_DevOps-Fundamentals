#!/bin/bash

#Checking for correct arguments
if [ ! -d "$1" ] || [ ! -d "$2" ]; then
	echo "You need to pass two parameters"
	echo "1. Path to the syncing  directory."
	echo "2. The path to the directory where the copies of the files will be stored."
	exit
fi

SOURCE=$1
DESTINATION=$2
LOG=$DESTINATION/file.log

#Creating backup directory and adding timestapm to log
if ! (mkdir $DESTINATION 2> /dev/null)
then
	echo "Directory already exists" >> $LOG
else
	echo "Creating directory" >> $LOG
fi

#Copying files and adding results to the log
echo "Copying Files" >> $LOG
cp -v $SOURCE/* $DESTINATION >> $LOG
echo "Finished Copying Files" >> $LOG
echo "Timestamp is $(date +"%D %T")" >> $LOG
