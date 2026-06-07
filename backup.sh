#!/bin/bash

#Backup Script - copies a folder to a backup location

SOURCE="$1"
BACKUP_FILE="$2"
DATE=$(date +%Y-%m-%d)

if [ -z "$SOURCE" ] || [ -z "$BACKUP_FILE" ]; then
	echo "Please provide a source and a backup directory"
	echo "Usage: ./backup.sh /path/to/source /path/to/backup"
	exit 1
fi

if [ ! -d "$SOURCE" ]; then
	echo "Source folder not found: $SOURCE"
	exit 1
fi


BACKUP_PATH="$BACKUP_FILE/backup-$DATE"

mkdir -p "$BACKUP_PATH"
cp -r "$SOURCE"/* "$BACKUP_PATH/"

echo "Backup complete!"
echo "Saved to: $BACKUP_PATH"
