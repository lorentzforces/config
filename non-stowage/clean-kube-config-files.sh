#!/usr/bin/env bash

# Delete kubeconfig files older than two weeks.

main() {

	>&2 printenv PATH

	local timestamp
	timestamp=${ date -d '2 weeks ago' '+%s'; }
	prunejuice --include '\Aconfig_' --since-unix-time "$timestamp" --no-confirm "$HOME/.kube"
}

main
