#!/usr/bin/env bash

# taken from a post by Cameron Fowler on Abletech
# original URL: https://stories.abletech.nz/get-rid-of-your-vim-plugin-manager-7c8ff742f643#.abnjauzgk
# some very small modifications have been made to the base path in order to use
# this script with Neovim

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.config/nvim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url"
  fi
}

# Configuration area
# Add plugins in groups that make sense here
(
	set_group plugins
	package https://github.com/junegunn/fzf.git &
	package https://github.com/junegunn/fzf.vim.git &
	package https://github.com/airblade/vim-gitgutter.git &
	package https://github.com/neoclide/coc.nvim.git &
	wait
) &

wait

# re-generate helptags
echo ":helptags ALL" | nvim -es
