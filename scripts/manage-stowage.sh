#!/usr/bin/env bash
set -u

# not using shared scripts because this is part of environment bootstrapping
CYAN=${ tput setaf 6; } # (cyan/6, purple for me)
YELLOW=${ tput setaf 3; }
BLACK=${ tput setaf 8; }
BOLD=${ tput bold; }
RESET=${ tput sgr0; }

main() {
	# This wouldn't normally be good practice, but the alternative is obnoxious and this is where
	# I'm going to be pretty much every time anyway.
	if [[ ! -d './stowage/universal-scripts' ]]; then
		print_error "Expected current directory to be the root of the config repo, but it looks like it isn't."
		return 1
	fi

	local operation_clean=""
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
	local machine_label
	if ! machine_label=${ 2>/dev/null cat "$HOME/.ltz_machine_label"; }; then
		print_error "Machine label file at $HOME/.ltz_machine_label does not exist."
		return 1
	fi
	case "$machine_label" in
	"main-desktop")
		stowage_targets+=("main-machine" "ssh-agent-systemd")
		;;
	"main-laptop")
		stowage_targets+=("laptop-machine" "ssh-agent-systemd")
		;;
	"work-mac")
		stowage_targets+=("work-machine" "k9s")
		;;
	*)
		print_error "Machine label \"${machine_label}\" does not correspond to a known configuration."
		return 1
		;;
	esac

	print_info "Performing setup steps for machine: ${machine_label}"

	# if clean operation, do that
	if [[ -n "$operation_clean" ]]; then
		do_clean "${stowage_targets[@]}"
	else
		do_stow "${stowage_targets[@]}"
	fi
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
	>&2 echo
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

		>&2 echo
		print_info "Enabling ssh-agent service via systemctl..."
		systemctl --user enable ssh-agent.service
		systemctl --user start ssh-agent
	fi
}

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

${BOLD}${BLACK}USAGE:${RESET} scripts/manage-stowage.sh [OPTIONS]

When invoked this tool (by default) will do a re-stow operation, cleaning up dangling symlinks and
creating new ones where necessary. Note that this script ASSUMES that it is being run with the
working directory being the root of my personal config repo so it can properly tell 'stow' where
its files are.

Some related setup steps are also done:
- enable the ssh-agent systemd unit when relevant

${BOLD}${BLACK}OPTIONS${RESET}

-h or --help
Print this help message.

--clean
Do a clean operation, deleting all symlinks to stow-managed files via 'stow --delete'. Will ONLY
remove links, this operation does not re-stow anything.

${BOLD}${BLACK}NOTES${RESET}

There are situations where dangling symlinks will not be cleared up. Since stow only operates on
the packages it is passed as arguments, if you remove a package from a list then run a re-stow or
delete operation, it will not be removed. (That package isn't on the list being operated on!)
The solution in that case is to do a clean/delete operation WITH that package listed, then remove
it from the list and re-stow to add files back.
EOF
	)
	echo "$msg"
}

main "$@"
