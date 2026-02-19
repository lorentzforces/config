#!/usr/bin/env bash
set -u

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
	"jj"
	"lf"
	"make"
	"nvim"
	"parallel"
	"qalc"
	"rg"
	"shellcheck"
	"selfman"
	"stow"
	"tmux"
)

package_managers=(
	"apt"
	"brew"
	"dnf"
	"flatpak"
	"zypper"
)

main() {
	declare -a not_found=()
	for prog in "${programs[@]}"; do
		if ! type -t "$prog" &>/dev/null ; then
			not_found+=("$prog")
		fi
	done

	if (( ${#not_found[@]} == 0 )); then
		echo "All expected programs found!"
	else
		echo "Programs not found:"
		echo ""
		IFS=$'\t' echo "${not_found[*]}" | column -c 80
	fi

	echo ""

	declare -a found_pkg_mans=()
	for pkg_man in "${package_managers[@]}"; do
		if type -t "$pkg_man" &>/dev/null ; then
			found_pkg_mans+=("$pkg_man")
		fi
	done

	if (( ${#found_pkg_mans[@]} > 0 )); then
		IFS=$' ' echo "Package managers found: ${found_pkg_mans[*]}"
	fi

	# miscellaneous warnings

	# check for a 3.x.x version of bash like is shipped on MacOS
	if [[ "$BASH_VERSION" == "3."* ]]; then
		printf "Warning: bash version \"%s\" appears old\n" "$BASH_VERSION"
	fi

	# check for `date` flavor: BSD/MacOS version does not have the '--version' flag
	if ! &>/dev/null date --version; then
		echo "Warning: 'date' flavor appears to be BSD"
	fi
}

main
