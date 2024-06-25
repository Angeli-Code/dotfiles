#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage: $0 <file> <session_name>"
	exit 1
fi

current_file="$1"
session_name="$2"

tmux new-session -d -s "$session_name" "nvim $current_file"
