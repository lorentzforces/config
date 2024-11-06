#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# print a nice message with helpful info whenever a session or shell starts

date_string=$(date "+%a %b %d, %Y :: %R")
printf "  %s\n" "$date_string"

set +e
tmux_running=""
2>/dev/null tmux has-session && tmux_running="running"
set -e

printf "  tmux: "
if [[ -z "$tmux_running"  ]]; then
	printf "no tmux sessions running\n"
else
	tmux_client_count=$(tmux list-clients | wc -l)
	tmux_session_count=$(tmux list-sessions | wc -l)
	tmux_window_count=$(tmux list-windows | wc -l)
	printf "%s/%s/%s (sessions/windows/clients)\n" \
		"$tmux_session_count" \
		"$tmux_window_count" \
		"$tmux_client_count"
fi

printf "\n"
