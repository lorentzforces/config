#!/usr/bin/env bash
set -u
IFS=$'\n\t'

# One-liner

DL_PATH="/tmp/install-sdkman-script"
SDK_INSTALL_URL="https://get.sdkman.io?rcupdate=false"

if [[ -f "$DL_PATH" ]]; then
	rm "$DL_PATH"
fi

curl -s "$SDK_INSTALL_URL" >"$DL_PATH" || {
	>&2 echo "Failed to download sdkman install script from ${SDK_INSTALL_URL}";
	exit 1;
}

SDKMAN_DIR="$HOME/.local/share/sdkman" bash -- "$DL_PATH"
