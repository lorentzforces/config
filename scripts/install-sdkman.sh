#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# One-liner

SDKMAN_DIR="$HOME/mine/programs/sdkman" \
	curl -s "https://get.sdkman.io?rcupdate=false" | bash
