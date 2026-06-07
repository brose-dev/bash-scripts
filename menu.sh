#!/bin/bash

#Server Tools Menu - script for server tools menu

SCRIPT_DIR="$(dirname "$0")"

while true; do
	echo ""
	echo "=========================================="
	echo "             Server Tools Menu"
	echo "=========================================="
	echo "1) File Organizer"
	echo "2) Log Parser"
	echo "3) Disk Space Checker"
	echo "4) Server Health Check"
	echo "5) Backup Script"
	echo "6) User Account Checker"
	echo "7) Service Monitor"
	echo "8) System Info Report"
	echo "9) Bulk Server Check"
	echo "10) Log Rotation"
	echo "11) Failed Login Monitor"
	echo "12) Server Report Emailer"
	echo ""
	echo "0) Exit"
	echo "=========================================="
	echo -n "Pick an option:"
	read choice

	case $choice in
		1)
			echo -n "Enter source folder path: "
			read src
			src="${src/#\~/$HOME}"
			bash "$SCRIPT_DIR/file_organizer.sh" "$src"
			;;
		2)
			echo -n "Enter log file path: "
			read logfile
			logfile="${logfile/#\~/$HOME}"
			bash "$SCRIPT_DIR/log_parser.sh" "$logfile"
			;;
		3) bash "$SCRIPT_DIR/disk_checker.sh" ;;
		4)
			echo -n "Enter process name to check: "
			read proc
			bash "$SCRIPT_DIR/server_health.sh" "$proc"
			;;
		5)
			echo -n "Enter source folder to backup: "
			read sou
			echo -n "Enter backup destination: "
			read dest
			sou="${sou/#\~/$HOME}"
			dest="${dest/#\~/$HOME}"
			bash "$SCRIPT_DIR/backup.sh" "$sou" "$dest"
			;;
		6)
			echo -n "Enter username to check: "
			read uname
			bash "$SCRIPT_DIR/user_checker.sh" "$uname"
			;;
		7) bash "$SCRIPT_DIR/service_monitor.sh" ;;
		8) bash "$SCRIPT_DIR/system_info.sh" ;;
		9)
			echo -n "Enter path to hosts file: "
			read hostsfile
			hostsfile="${hostsfile/#\~/$HOME}"
			bash "$SCRIPT_DIR/bulk_server_check.sh" "$hostsfile"
			;;
		10)
			echo -n "Enter log directory path: "
			read logdir
			echo -n "Enter archive destination path: "
			read archivedir
			logdir="${logdir/#\~/$HOME}"
			archivedir="${archivedir/#\~/$HOME}"
			bash "$SCRIPT_DIR/log_rotation.sh" "$logdir" "$archivedir"
			;;
		11) bash "$SCRIPT_DIR/failed_login_monitor.sh" ;;
		12)
			echo -n "Enter recipient email address: "
			read email
			bash "$SCRIPT_DIR/server_report_emailer.sh" "$email"
			;;
		0) echo "Goodbye!"; exit 0 ;;
		*) echo "Invalid option. Try again." ;;
	esac
done
