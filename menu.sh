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
		1) bash "$SCRIPT_DIR/file_organizer.sh" ;;
		2) bash "$SCRIPT_DIR/log_parser.sh" ;;
		3) bash "$SCRIPT_DIR/disk_checker.sh" ;;
		4) bash "$SCRIPT_DIR/server_health.sh" ;;
		5) bash "$SCRIPT_DIR/backup.sh" ;;
		6) bash "$SCRIPT_DIR/user_checker.sh" ;;
		7) bash "$SCRIPT_DIR/service_monitor.sh" ;;
		8) bash "$SCRIPT_DIR/system_info.sh" ;;
		9) bash "$SCRIPT_DIR/bulk_server_check.sh" ;;
		10) bash "$SCRIPT_DIR/log_rotation.sh" ;;
		11) bash "$SCRIPT_DIR/failed_login_monitor.sh" ;;
		12) bash "$SCRIPT_DIR/server_report_emailer.sh" ;;
		0) echo "Goodbye!"; exit 0 ;;
		*) echo "Invalid option. Try again." ;;
	esac
done
