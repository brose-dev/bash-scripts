#!/bin/bash

#User Account Checker - checks if a user exists amd their status

USERNAME="$1"

if [ -z "$USERNAME" ]; then
	echo "Please provide a username"
	echo "Usage: ./user_checker.sh username"
	exit 1
fi

if id "$USERNAME" > /dev/null 2>&1; then
	echo "User $USERNAME EXISTS on this system"
	echo "---------------------------------------"
	echo "User ID: $(id -u $USERNAME)"
	echo "Group ID: $(id -g $USERNAME)"
	echo "Groups: $(groups $USERNAME)"
	echo "Home Directory: $(eval echo ~$USERNAME)"

	if passwd -S "$USERNAME" 2>/dev/null | grep -q "L"; then
		echo "Account Status: LOCKED"
	else
		echo "Account Status: ACTIVE"
	fi

	echo "Last Login: $(last -n 1 $USERNAME)"
else
	echo "User $USERNAME does NOT exist on this system"
fi
