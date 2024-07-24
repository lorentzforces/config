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
	"rg"
	"shellcheck"
	"stow"
	"tmux"
	"tmuxp"
)

files=(
	"$HOME/mine"
	"$HOME/mine/programs/bin"
	"$HOME/mine/programs/sdkman/bin/sdkman-init.sh"
)

function main() {
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

	local file_output=""
	for file in "${files[@]}"; do
		if ! [[ -r "$file" ]]; then
			file_output="${file_output}${file}\n"
		fi
	done

	if [[ -z "$file_output" ]]; then
		printf "All expected files found!\n"
	else
		printf "Files not found:\n\n%b\n" "$file_output"
	fi
}

main
