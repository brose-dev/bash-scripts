#!/bin/bash

#System Info Report - pulls key system information into one report

DATE=$(date +%Y-%m-%d_%H:%M:%S)

echo "========================================"
echo "System Info Report - $DATE"
echo "========================================"

echo ""
echo "HOSTNAME:"
hostname

echo ""
echo "OS VERSION: "
cat /etc/os-release | grep PRETTY_NAME | tr -d '"' | cut -d'=' -f2

echo ""
echo "UPTIME: "
uptime -p

echo ""
echo "CPU USAGE: "
top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,'
echo "% used"

echo ""
echo "MEMORY USAGE: "
free -h | awk '/^Mem:/ {print "Total: "$2, "| Used: "$3, "| Free: "$4}'

echo ""
echo "DISK USAGE: "
df -h | awk '$NF=="/" {print "Total: "$2, "| Used:  "$3, "| Free: "$4, "| Usage: "$5}'

echo ""
echo "========================================"
echo "End of Report"
echo "========================================"
