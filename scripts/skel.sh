#!/usr/bin/env bash
set -u
IFS=$'\n\t'

# Create my entire directory structure (or verify it's there).
#
# Focus here is on directories which I need/expect to exist. This doesn't take any action or make
# any assertions about the contents of those directories (for example, mine/media is here, but not
# mine/media/books).
#
# All paths are relative to $HOME.

paths=(
	"mine/programs"
	"mine/info"
	"mine/media"
	"mine/repos"
)

main() {
	for skel_dir in "${paths[@]}"; do
		mkdir -p "$HOME/$skel_dir"
	done
}

main
