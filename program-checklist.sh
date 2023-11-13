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
	"git"
	"stow"
	"nvim"
	"make"
	"lf"
	"fzf"
	"tmux"
	"tmuxp"
	"jdtls"
	"fnm"
	"rg"
	"brew"
	"go"
	"ensure-path"
)
# sdkman cannot be checked using this script - it performs its setup by defining its "command" as
# a function called "sdk." Since functions are not available in subshells invoked as a script
# (like this script), it is effectively invisible here.

for prog in ${programs[@]}; do
	set +e
	type -t "$prog" &>/dev/null
	exitval=$?
	if [ $exitval != 0 ]; then
		echo "$prog"
	fi
	set -e
done
