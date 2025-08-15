#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# This script checks for a number of executables used throughout my environment setup for various
# tasks. This is defined outside the Makefile to make it a much simpler task to check these upon
# initially pulling down this repository - the only requirement is the presence of bash.
#
# Not all programs listed here are essential, just things which may be useful to know are or are
# not installed.

programs=(
	"awk"
	"bash"
	"bash-language-server"
	"brew"
	"dircolors"
	"ensure-path"
	"fnm"
	"fzf"
	"git"
	"go"
	"gopls"
	"jdtls"
	"lf"
	"make"
	"nvim"
	"qalc"
	"rg"
	"shellcheck"
	"selfman"
	"stow"
	"tmux"
	"tmuxp"
)

main() {
	local prog_output=""
	for prog in "${programs[@]}"; do
		set +e
		type -t "$prog" &>/dev/null
		local exitval=$?
		set -e
		if [[ $exitval != 0 ]]; then
			prog_output="${prog_output}$prog\n"
		fi
	done

	if [[ -z "$prog_output" ]]; then
		printf "All expected programs found!\n"
	else
		printf "Programs not found:\n\n%b" "$prog_output"
	fi

	printf "\n"
}

main
