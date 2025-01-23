SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

COMMON_LIST := alacritty neovim tmux bash lf universal-scripts git-files ripgrep
MAIN_MACHINE_LIST := ${COMMON_LIST} main-machine rofi redshift awesomewm opensuse-tumbleweed
WORK_MACHINE_LIST := ${COMMON_LIST} work-machine k9s
LAPTOP_MACHINE_LIST := ${COMMON_LIST} laptop-machine rofi redshift sway opensuse-tumbleweed

setup-main: STOWLIST = ${MAIN_MACHINE_LIST}
setup-main: setup-machine-stow
.PHONY: setup-main

setup-work: STOWLIST = ${WORK_MACHINE_LIST}
setup-work: setup-machine-stow
.PHONY: setup-work

setup-laptop: STOWLIST = ${LAPTOP_MACHINE_LIST}
setup-laptop: setup-machine-stow
.PHONY: setup-laptop

setup-machine-stow:
	stow --restow --no-folding --target="${HOME}" --dir="./stowage" ${STOWLIST}
.PHONY: setup-machine-stow

clean-stow-main: STOWLIST = ${MAIN_MACHINE_LIST}
clean-stow-main: clean-stow
.PHONY: clean-stow-main

clean-stow-work: STOWLIST = ${WORK_MACHINE_LIST}
clean-stow-work: clean-stow
.PHONY: clean-stow-work

clean-stow-laptop: STOWLIST = ${LAPTOP_MACHINE_LIST}
clean-stow-laptop: clean-laptop
.PHONY: clean-stow-laptop

clean-stow:
	stow --delete --target="${HOME}" --dir="./stowage" ${STOWLIST}
.PHONY: clean-stow

skel:
	scripts/skel.sh
.PHONY: skel
