#!/bin/bash

#Disk space Checker - warns if disk usage is over 80%

THRESHOLD=80

df -h | tail -n +2 | while read line; do
	usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
	mount=$(echo "$line" | awk '{print $6}')

	if [ "$usage" -gt "$THRESHOLD" ]; then
		echo "WARNING: $mount is at $usage% capacity"
	else
		echo "OK: $mount is at $usage% capacity"
	fi
done

echo "Disk check complete!"
