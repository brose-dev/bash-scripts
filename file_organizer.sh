#!/bin/bash

#File Organizer - sorts files in a folder by type

SOURCE_DIR="$1"

if [ -z "$SOURCE_DIR" ]; then
	echo "Please provide a folder path"
	echo "Usage: ./file_organizer.sh /path/to/folder"
	exit 1

fi

for file in "$SOURCE_DIR"/*; do
	if [ -f "$file" ]; then
		ext="${file##*.}"
		mkdir -p "$SOURCE_DIR/$ext"
		mv "$file" "$SOURCE_DIR/$ext/"
		echo "Moved $file to $SOURCE_DIR/$ext/"
	fi
done

echo "Done organizing files!"

