#!/usr/bin/env bash
set -u

# Script to copy root files into the requisite locations. This is basically shorthand for a
# manual process: none of the commands will create the correct directory structure, only copy the
# appropriate files into existing directories.

WORKING_DIR=$(pwd)

main() {
	if [[ ! -d "${WORKING_DIR}/stowage/universal-scripts" ]]; then
		print_error "Expected current directory to be the root of the config repo, but it looks like it isn't."
		return 1
	fi

	print_info "This script copies root files and needs to invoke sudo to do so."
	if ! sudo -v ; then
		return 1
	fi

	# determine which machine we're operating on
	local machine_label
	if ! machine_label=$(2>/dev/null cat "$HOME/.ltz_machine_label"); then
		print_error "Machine label file at $HOME/.ltz_machine_label does not exist."
		return 1
	fi
	case "$machine_label" in
	"main-desktop")
		copy_for_main_machine
		;;
	"main-laptop")
		print_error "Root file setup not configured yet for this machine."
		;;
	"work-mac")
		print_info "This machine has no root files which need to be copied."
		return 1
		;;
	*)
		print_error "Machine label \"${machine_label}\" does not correspond to a known configuration."
		return 1
		;;
	esac
}

copy_for_main_machine() {
	sudo cp "${WORKING_DIR}/root-files/99-unconditionally-poweroff.conf" '/usr/lib/systemd/logind.conf.d'

	print_info "Root systemd files may have been changed: run 'systemctl daemon-reload' to reload changed configuration."
}

# not using shared scripts because this is part of environment bootstrapping
CYAN=$(tput setaf 6) # (cyan/6, purple for me)
YELLOW=$(tput setaf 3)
BLACK=$(tput setaf 8)
BOLD=$(tput bold)
RESET=$(tput sgr0)

print_info() {
	local msg=$1
	>&2 echo "${CYAN}${msg}${RESET}"
}

print_error() {
	local msg=$1
	>&2 echo "${YELLOW}${BOLD}${msg}${RESET}"
}

main "$@"
