#!/bin/bash

#Failed Login Monitor - scans auth log for failed SSH attempts and flags high counts

THRESHOLD=3
LOG_FILE="/var/log/auth.log"

if [ ! -f "$LOG_FILE" ]; then
	echo "Auth log not found: $LOG_FILE"
	exit 1
fi

echo "Scanning for failed SSH login attempts..."
echo "----------------------------------------------"

grep "Failed password" "$LOG_FILE" | \
	awk '{print $(NF-3)}' | \
	sort | \
	uniq -c | \
	sort -rn | \
	while read count ip; do
		if [ "$count" -gt "$THRESHOLD" ]; then
			echo "WARNING: $ip has $count failed attempts"
		else
			echo "OK: $ip has failed attempts"
		fi
	done


echo "----------------------------------------------"
echo "Scan complete!"

