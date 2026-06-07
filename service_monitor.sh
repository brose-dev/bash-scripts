#/bin/bash

#Service Monitor - checks a list of servcies and logs results

LOG_FILE=~/service_monitor.log
DATE=$(date +%Y-%m-%d_%H:%M:%S)

SERVICES=("ssh" "cron" "bash")

echo "Service Monitor Report - $DATE" |  tee -a "$LOG_FILE"
echo "----------------------------------"  | tee -a "$LOG_FILE"

for service in "${SERVICES[@]}"; do
	if pgrep -x "$service" > /dev/null; then
		echo "UP: $service" | tee -a "$LOG_FILE"
	else
		echo "DOWN: $service" | tee -a "$LOG_FILE"
	fi
done

echo "-------------------------------------" | tee -a "$LOG_FILE"
echo "Report saved to: $LOG_FILE"
