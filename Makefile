SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# not supported in versions of make shipped on MacOS, and I want to be able to boostrap this config
# as much as possible on a new Mac machine without having to monkey around with installing new
# tools
#
# ifeq ($(origin .RECIPEPREFIX), undefined)
#   $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
# endif
# .RECIPEPREFIX = >

COMMON_LIST := alacritty neovim tmux bash lf universal-scripts git-files ripgrep
MAIN_MACHINE_LIST := ${COMMON_LIST} main-machine
WORK_MACHINE_LIST := ${COMMON_LIST} work-machine k9s

setup-main: STOWLIST = ${MAIN_MACHINE_LIST}
setup-main: setup-machine-stow
.PHONY: setup-main

setup-work: STOWLIST = ${WORK_MACHINE_LIST}
setup-work: setup-machine-stow
.PHONY: setup-work

setup-machine-stow:
	stow --restow --no-folding --target="${HOME}" --dir="./stowage" ${STOWLIST}
.PHONY: setup-machine-stow

clean-stow-main: STOWLIST = ${MAIN_MACHINE_LIST}
clean-stow-main: clean-stow
.PHONY: clean-stow-main

clean-stow-work: STOWLIST = ${WORK_MACHINE_LIST}
clean-stow-work: clean-stow
.PHONY: clean-stow-work

clean-stow:
	stow --delete --target="${HOME}" --dir="./stowage" ${STOWLIST}
.PHONY: clean-stow
