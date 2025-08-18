set -uo pipefail
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
	"parallel"
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
		if ! type -t "$prog" &>/dev/null ; then
			prog_output="${prog_output}$prog\n"
		fi
	done

	if [[ -z "$prog_output" ]]; then
		printf "All expected programs found!\n"
	else
		printf "Programs not found:\n\n%b" "$prog_output"
	fi

	printf "\n"

	# miscellaneous warnings

	# check for a 3.x.x version of bash like is shipped on MacOS
	if [[ "$BASH_VERSION" == "3."* ]]; then
		printf "Warning: bash version \"%s\" appears old\n" "$BASH_VERSION"
	fi

	# check for `date` flavor
	local date_flavor
	date_flavor=$(date --version &>/dev/null && echo "GNU" || echo "BSD")
	if [[ "$date_flavor" == "BSD" ]]; then
		echo "Warning: 'date' flavor appears to be BSD"
	fi
}

main
