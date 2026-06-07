#!/bin/bash

#Log Parser - finds ERROR and FAILED lines in a file

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
	echo "Please provide a kog file"
	echo "Usage:  ./log_parser.sh /path/to/file.log"
	exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
	echo "File not found: $LOG_FILE"
	exit 1
fi

echo "Scanning $LOG_FILE for errors..."
echo "-----------------------------------"

grep -i "ERROR\|FAILED" "$LOG_FILE"

echo "-------------------------------------"
echo "Done!"
