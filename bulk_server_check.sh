#!/bin/bash

#Bulk Server Check - reads hostname from a file, tests if each is reachable

HOST_FILE="$1"

if [ -z "$HOST_FILE" ]; then
	echo "Please provide a file with hostnames"
	echo "Usage: ./bulk_server_check.sh /path/to/file"
	exit 1
fi

if [ ! -f "$HOST_FILE" ]; then
	echo "File not found: $HOST_FILE"
	exit 1
fi

echo "Checking servers..."
echo "-----------------------------------"

while IFS= read -r host; do
	if [ -z "$host" ]; then
		continue
	fi

	if ping -c 1 -W 1 "$host" > /dev/null 2>&1; then
		echo "REACHABLE: $host (ping)"
	elif nc -z -w 1 "$host" 22 > /dev/null 2>&1; then
		echo "REACHABLE: $host (port 22 - Linux)"
	elif nc -z -w 1 "$host" 3389 > /dev/null 2>&1; then
		echo "REACHABLE: $host (port 3389 - Windows)"
	else
		echo "UNREACHABLE: $host"
	fi

done < "$HOST_FILE"

echo "-----------------------------------"
echo "Done!"

