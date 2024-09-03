#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# install homebrew using the latest install script from their repository

git clone --depth 1 https://github.com/Homebrew/install.git /tmp/homebrew-install

exec /tmp/homebrew-install/install.sh
