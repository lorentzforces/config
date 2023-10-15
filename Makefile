SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

main_machine_list := main-machine alacritty neovim tmux bash lf universal-scripts git-files ripgrep
work_machine_list := work-machine alacritty neovim tmux bash lf universal-scripts git-files ripgrep

setup-main-machine:
> stow -R --no-folding --target="${HOME}" --dir="./stowage" ${main_machine_list}
.PHONY: setup-main-machine
