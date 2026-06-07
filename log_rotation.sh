#!/bin/bash

#Log Rotation - archives log older than 7 days and deletes archives older than 30 days

LOG_DIR="$1"
ARCHIVE_DIR="$2"
DATE=$(date +%Y-%m-%d)

if [ -z "$LOG_DIR" ] || [ -z "$ARCHIVE_DIR" ]; then
	echo "Please provide a log directory and archive directory"
	echo "Usage: ./log_rotation.sh /path/to/logs /path/to/archive"
	exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
	echo "Log directory not found: $LOG_DIR"
	exit 1
fi

mkdir -p "$ARCHIVE_DIR"

echo "Archiving logs older than 7 days..."
find "$LOG_DIR" -name "*.log" -mtime +7 | while read logfile; do
	echo "Archiving: $logfile"
	gzip -c "$logfile" > "$ARCHIVE_DIR/$(basename $logfile)-$DATE.gz"
	rm "$logfile"
done

echo "Deleting archives older than 30 days..."
find "$ARCHIVE_DIR" -name "*.gz" -mtime +30 | while read archive; do
	echo "Deleting: $archive"
	rm "$archive"
done

echo "Log rotation complete!"
