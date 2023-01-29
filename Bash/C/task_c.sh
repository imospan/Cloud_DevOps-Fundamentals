#!/bin/bash

#Checking for correct arguments
if [ ! -d "$1" ] || [ ! -d "$2" ]; then
	echo "You need to pass two parameters"
  echo "1. The path to the directory where the copies of the files will be stored."
  echo "2. Path to the syncing  directory."
	exit
fi

DESTINATION=$1
SOURCE=$2
LOG=$DESTINATION/file.log

#Creating backup directory and adding timestapm to log
if ! (mkdir $DESTINATION 2> /dev/null)
then
	echo "Directory already exists" >> $LOG
else
  echo "Creating directory" >> $LOG
fi
echo "Timestamp is done $(date +"%D %T")" >> $LOG

#Copying files and adding results to the log
echo "Copying Files" >> $LOG
cp -v $SOURCE/* $DESTINATION >> $LOG
echo "Finished Copying Files" >> $LOG
echo "Timestamp is $(date +"%D %T")" >> $LOG
