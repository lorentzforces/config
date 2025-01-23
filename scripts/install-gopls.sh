#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# install the latest version of gopls (for the current go language version)

go install golang.org/x/tools/gopls@latest
