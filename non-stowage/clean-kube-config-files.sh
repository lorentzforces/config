#!/usr/bin/env bash

# Delete kubeconfig files older than two weeks.

main() {
	local timestamp
	timestamp=${ date -d '2 weeks ago' '+%s'; }
	printf "Removing the following files: [%s]" "${ date '--iso-8601=seconds'; }\n"
	prunejuice --include '\Aconfig_' --since-unix-time "$timestamp" --print-only "$HOME/.kube"
	prunejuice --include '\Aconfig_' --since-unix-time "$timestamp" --no-confirm "$HOME/.kube"
	printf '\n\n'
}

main
