#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# One-liner

curl -s "https://get.sdkman.io?rcupdate=false" | SDKMAN_DIR="$HOME/.local/share/sdkman" bash
