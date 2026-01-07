#!/usr/bin/env bash
set -u

# install homebrew using the latest install script from their repository

git clone --depth 1 https://github.com/Homebrew/install.git /tmp/homebrew-install \
	|| { >&2 echo "failed to clone homebrew from github"; exit 1; }

exec /tmp/homebrew-install/install.sh
