#!/bin/bash

#Server Health Check - checks if a process is running 

PROCESS="$1"

if [ -z "$PROCESS" ]; then
	echo "Please provide a process name"
	echo "Usage: ./server_health.sh /path/to/file"
	exit 1
fi

if pgrep -x "$PROCESS" > /dev/null; then
	echo "UP: $PROCESS  is running"
else
	echo "DOWN: $PROCESS is not running"
fi

