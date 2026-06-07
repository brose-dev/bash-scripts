#!/bin/bash

#Server Report Emailer - runs system info and emails the report

RECIPIENT="$1"

if [ -z "$RECIPIENT" ]; then
	echo "Please provide an email address"
	echo "Usage: ./server_report_emailer.sh email@example.com"
	exit
fi

DATE=$(date +%Y-%m-%d_%H:%M:%S)
REPORT_FILE="/tmp/server_report_$DATE.txt"

echo "Generating server report..."

{
	echo "===================================="
	echo "Server Report - $DATE"
	echo "===================================="
	echo ""
	echo "HOSTNAME: $(hostname)"
	echo ""
	echo "OS VERSION"
	cat /etc/os-release | grep PRETTY_NAME | tr -d '"' | cut -d'=' -f2
	echo ""
	echo "MEMORY USAGE:"
	free -h | awk '/^Mem:/ {print "Total: "$2, "| Used: "$3, "| Free: "$4}'
	echo ""
	echo "DISK USAGE:"
	df -h | awk '$NF=="/" {print "Total: "$2, "| Used: "$3, "| Free: "$4, "| Usage: "$5}'
	echo ""
	echo "===================================="
	echo "End of Report"
	echo "===================================="
} > "$REPORT_FILE"


echo "Generating server report using system_info.sh..."

SYSTEM_INFO_FILE="$(dirname "$0")/system_info.sh"

if [ ! -f "$SYSTEM_INFO_FILE" ]; then
	echo "File not found: $SYSTEM_INFO_FILE"
else
	bash "$SYSTEM_INFO_FILE"  >> "$REPORT_FILE"
fi

mail -s "Server Report - $(hostname) - $DATE" "$RECIPIENT" < "$REPORT_FILE"

echo "Report sent to $RECIPIENT"
rm "$REPORT_FILE"

