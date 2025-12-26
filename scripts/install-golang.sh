#!/usr/bin/env bash
set -u

# install the specified version of golang, pulling from the official site

# update this to specify version for script to install
GO_VERSION=1.25.4

GO_FILENAME="go${GO_VERSION}.linux-amd64.tar.gz"
DOWNLOAD_DIR="/tmp/install-golang-script"
TARBALL_PATH="${DOWNLOAD_DIR}/${GO_FILENAME}"
GO_INSTALL_PARENT_DIR="/usr/local"
GO_INSTALL_PATH="/usr/local/go"
GO_TEMP_SAVE_PATH="${DOWNLOAD_DIR}/go-old"

main() {
	check_not_macos
	check_already_installed
	get_tarball
	print_info "NOTE: this script will require sudo elevation"
	mv_old_install

	unpack_install || { put_old_install_back "Failed to unpack installation"; exit 1; }
	&>/dev/null go version || { put_old_install_back "Go not available after unpacking"; exit 1; }
	clean_old_install
	print_info "Successfully installed golang $GO_VERSION 👍"
	go version
}

check_not_macos() {
	if [[ $(uname -s) == "Darwin" ]]; then
		read -r -d '' ERROR_MSG <<-EOF
		Manual installation from tarball is not recommended on MacOS.
		Instead consider installing from homebrew:
		EOF
		print_error "$ERROR_MSG"
		print_shell_cmd "brew install go"
		exit 1
	fi
}

check_already_installed() {
	if &>/dev/null type go; then
		local target_go_version existing_go_version
		target_go_version="go${GO_VERSION}"
		existing_go_version=$(go version | awk '{ print $3 }')
		if [[ "$target_go_version" == "$existing_go_version" ]]; then
			print_info "Golang version ${GO_VERSION} already present. All done! 👍"
			exit 0
		fi
	fi
}

get_tarball() {
	if [[ -f "$TARBALL_PATH" ]]; then
		print_info "Golang install tarball at ${TARBALL_PATH} already exists 👍"
		>&2 echo
	else
		mkdir -p "$DOWNLOAD_DIR"
		local GO_DOWNLOAD_URL="https://go.dev/dl/${GO_FILENAME}"
		print_info "Fetching golang install tarball from ${GO_DOWNLOAD_URL} ..."
		print_info ""
		curl --url "$GO_DOWNLOAD_URL" --follow --output "$TARBALL_PATH"
		print_info ""
	fi
}

mv_old_install() {
	if [[ ! -d "$GO_INSTALL_PATH" ]]; then
		return 0
	fi

	sudo mv "$GO_INSTALL_PATH" "$GO_TEMP_SAVE_PATH"
}

unpack_install() {
	sudo tar -C "$GO_INSTALL_PARENT_DIR" -xf "$TARBALL_PATH"
}

put_old_install_back() {
	local msg=$1
	print_error "ERROR: $1"
	print_error "Aborting and replacing old install..."
	sudo rm -rf "$GO_INSTALL_PATH"
	sudo mv "$GO_TEMP_SAVE_PATH" "$GO_INSTALL_PATH"
}

clean_old_install() {
	print_info "Cleaning up..."
	sudo rm -rf "$GO_TEMP_SAVE_PATH"
}

CYAN=$(tput setaf 6) # (cyan/6, purple for me)
YELLOW=$(tput setaf 3)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# not using shared scripts because this is part of environment bootstrapping

print_info() {
	local msg=$1
	>&2 echo "${CYAN}${msg}${RESET}"
}

print_error() {
	local msg=$1
	>&2 echo "${YELLOW}${BOLD}${msg}${RESET}"
}

print_shell_cmd() {
	local cmd=$1
	>&2 echo "    ${BOLD}${cmd}${RESET}"
}

main
