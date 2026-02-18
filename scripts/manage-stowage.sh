#!/usr/bin/env bash
set -u

main() {
	# this wouldn't normally be good practice, but the alternative is obnoxious and this is where
	# I'm going to be pretty much every time anyway.
	if [[ ! -d './stowage/universal-scripts' ]]; then
		print_error "Expected current directory to be the root of the config repo, but it looks like it isn't."
		return 1
	fi

	local operation_clean="" operation_clean_restow=""
	while true && (($# > 0)); do
		case $1 in
		-h | --help)
			print_help
			exit 1
			;;
		--clean)
			operation_clean="yes"
			shift
			;;
		--clean-and-restow)
			operation_clean_restow="yes"
			shift
			;;
		--)
			shift
			break
			;;
		-?*)
			print_error "Unknown option: \"${1}\""
			exit 1
			;;
		*)
			break
			;;
		esac
	done

	local stowage_targets=(
		"alacritty"
		"bash"
		"git-files"
		"jujutsu"
		"lf"
		"neovim"
		"ripgrep"
		"selfman"
		"tmux"
		"universal-scripts"
	)

	# determine which machine we're operating on
	local hostname hostname_hash friendly_machine_label
	hostname=${ hostname; }
	hostname_hash=${ sha256 -s "$hostname"; }
	case "$hostname_hash" in
	"3dd0e6c2a0d2220fd59f07ee2f84d7cdf1ff27c2a9245808338d24d0a6363b89")
		friendly_machine_label="work"
		stowage_targets+=("k9s")
		;;
	*)
		print_error "Could not determine identity of this machine via hostname."
		echo "hostname: ${hostname}"
		echo "hostname hash: ${hostname_hash}"
		return 1
		;;
	esac

	print_info "Performing setup steps for machine: ${friendly_machine_label}"

	# if clean operation, do that
	if [[ -n "$operation_clean_restow" ]]; then
		do_clean "${stowage_targets[@]}"
		do_stow "${stowage_targets[@]}"
	elif [[ -n "$operation_clean" ]]; then
		do_clean "${stowage_targets[@]}"
	else
		do_stow "${stowage_targets[@]}"
	fi
	# else, restow
	# if restowing and the machine has the ssh-agent file present, activate the ssh-agent service via systemctl
}

do_clean() {
	print_info "WARNING: cleaning the following stow collections:"
	local old_ifs="$IFS"
	IFS=$'\n'
	print_info "${ echo "$*" | column -c 80; }"
	IFS="$old_ifs"

	stow --delete --target="$HOME" --dir="./stowage" "$@"
}

do_stow() {
	print_info "Stowing the following collections:"
	local old_ifs="$IFS"
	IFS=$'\n'
	print_info "${ echo "$*" | column -c 80; }"
	IFS="$old_ifs"
	stow --restow --no-folding --target="$HOME" --dir="./stowage" "$@"

	if [[ -r "$HOME/.config/systemd/user/ssh-agent.service" ]]; then
		if ! &>/dev/null type systemctl; then
			print_error "This system has a ssh-agent service file configured, but does not have systemctl available."
			return 1
		fi

		print_info "Enabling ssh-agent service via systemctl..."
		systemctl user enable ssh-agent.service
		systemctl user start ssh-agent
	fi
}

# not using shared scripts because this is part of environment bootstrapping
CYAN=${ tput setaf 6; } # (cyan/6, purple for me)
YELLOW=${ tput setaf 3; }
BOLD=${ tput bold; }
RESET=${ tput sgr0; }

print_info() {
	local msg=$1
	>&2 echo "${CYAN}${msg}${RESET}"
}

print_error() {
	local msg=$1
	>&2 echo "${YELLOW}${BOLD}${msg}${RESET}"
}

print_help() {
	local msg
	msg=$(cat <<EOF
Personal stow files management

${BOLD}USAGE:${RESET} scripts/manage-stowage.sh [OPTIONS]

When invoked this tool (by default) will do a re-stow operation, cleaning up dangling symlinks and
creating new ones where necessary. Note that this script ASSUMES that it is being run with the
working directory being the root of my personal config repo so it can properly tell 'stow' where
its files are.

${BOLD}OPTIONS${RESET}

-h or --help
Print this help message.

--clean-and-restow
Do a clean and restow operation, which basically is the --clean option followed by the standard
behavior. This is probably what you should reach for first in a "why is this file still here"
situation.

--clean
Do a clean operation, deleting all symlinks to stow-managed files via 'stow --delete'. Will ONLY
remove links, this operation does not re-stow anything.
EOF
	)
	echo "$msg"
}

main "$@"
