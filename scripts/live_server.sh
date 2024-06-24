#!/bin/bash

# ===================================================================================
# Script that allows me to start a python server. Primarily used for viewing frontend
# ===================================================================================

DIR=$(dirname "$1")

cd "$DIR" || exit

start_live_server() {
	local command="python3 -m http.server"
	local port=8000
	while true; do
		$command $port >/dev/null 2>&1 &
		local pid=$!
		sleep 1
		if ps -p $pid >/dev/null; then
			break
		else
			port=$((port + 1))
		fi
	done
	local_url="http://localhost:$port"
	echo "$local_url"
}

start_live_server
