#!/usr/bin/env bash
# shebang here is just for easy filetype detection; this script is always sourced

__prompt_cmd() {
	local prev_status="$?"

	# NOTE: The bash prompt requires any non-printing characters (like escape sequences) to be
	# enclosed with square braces for cursor-position-counting reasons, since bash itself has no
	# idea what characters are printing or not. This is not true in general bash scripts, so the
	# next time you copy some sequences from here KEEP THAT IN MIND.

	# I have some colors swapped from their typical representations in my typical color scheme
	# (red is not one of them)
	local red='\[\033[31m\]'
	local purple='\[\033[35m\]' # terminal: purple/5, me: orange
	local cyan='\[\033[36m\]' # terminal: cyan/6, me: purple
	local bold='\[\033[1m\]'
	local reset='\[\033[0m\]'

	PS1=""
	PS1+="$bold"
	PS1+="$red"
	PS1+="\w ▸\n"

	if [[ $prev_status -ne 0 ]]; then
		PS1+="$cyan"
		PS1+=" !$prev_status"
	fi

	PS1+="$reset"
	PS1+="$bold"
	PS1+="$purple"
	PS1+=" :) "

	PS1+="$reset"
}
