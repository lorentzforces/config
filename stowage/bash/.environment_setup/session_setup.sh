# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

if [ -r "$HOME/.environment_setup/fzf_config.sh" ]; then
	source "$HOME/.environment_setup/fzf_config.sh"
fi

# I keep hitting ctrl-d to page up and down a la vim, but this closes the terminal by default
set -o ignoreeof

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth
# use timestamps with history
HISTTIMEFORMAT="%F %T " # trailing space is important

# we assume that our terminal supports xterm color codes
export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\]:) \\[\\033[39m\\]'

# store "host" terminal so we can use the same terminfo in tmux
export HOST_TERM=$TERM

export PAGER="nvim -R -"
export MANPAGER="nvim +Man!"
export MANWIDTH="120"
export LESS="-R --tabs=4"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
export TMUXP_CONFIGDIR="$HOME/.config/tmuxp"
export GOPATH="$HOME/.go"
export K9S_CONFIG_DIR="$HOME/.config/k9s"

eval "$(dircolors -b "$HOME"/.config/ls-colors.conf)"

eval "$(fnm env)"
eval "$(fnm completions --shell bash)"

# fix path after fnm chucks new stuff on it
PATH=$(ensure-path -d "fnm_multishells" "${FNM_MULTISHELL_PATH}/bin")
export PATH

# expects 1 argument which is the prompt text
function _confirm()
{
	read -p "$1 " -n 1 -r
	printf "\n" # move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		return 1
	fi
}

### aliases ###

alias ls='ls --color=auto --group-directories-first --classify --width=90'
alias la='ls -A --group-directories-first --color=auto'
alias ll='ls -Alh --group-directories-first --color=auto'

alias g='git'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdm='cd $HOME/mine'

function gco()
{
	local target
	target=$(_fzf_git_branches)

	if [ -z "$target" ]; then
		return 1
	else
		git checkout "$target"
	fi
}

function delete-branch()
{
	local target
	target=$(_fzf_git_branches)

	if [ -z "$target" ]; then
		return 1
	else
		_confirm "Are you sure you want to delete branch: $target? " || return
		git branch -d "$target"
	fi
}

alias fshow='_fzf_git_show'
alias fcd='_fzf_cd_containing_dir'

alias page='nvim -R'
alias pageify='fc -s | nvim -R -'
alias lessify='fc -s | less -R'

alias restow='stow -R --no-folding'

alias printpath='printenv PATH | sed s/:/\\n/g'

# lf alias with directory following (when lf exits, cd to the directory it was in)
function fd()
{
	local tmp
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		local dir
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [[ -d "$dir" && "$dir" != "$(pwd)" ]]; then
			cd "$dir" || { echo "cd to $dir failed" 1>&2; exit 1; }
		fi
	fi
}

function fdev()
{
	local dev_dir
	dev_dir=$(_fzf_directories_at "$HOME/mine/repos")

	if [ -z "$dev_dir" ]; then
		return 1
	else
		local dev_name
		dev_name=$(basename "$dev_dir")
		DEV_DIR="$dev_dir" DEV_NAME="$dev_name" tmuxp load --yes dev
	fi
}

function tmuxhere()
{
	local target_dir
	if [ -n "$1" ]; then
		target_dir="$1"
	else
		target_dir=$(pwd)
	fi

	local name
	name=$(basename "$target_dir")
	SESSION_NAME="$name" SESSION_PATH="$target_dir" tmuxp load --yes "generic-with-path"
}

function fmux()
{
	local tmuxp_file
	tmuxp_file=$(
		tmuxp ls \
		| rg -v "dev|generic-with-path" \
		| fzf-tmux -u20 -- --no-hscroll --ansi --no-multi
	)

	if [ -z "$tmuxp_file" ]; then
		return 1
	else
		tmuxp load --yes "$tmuxp_file"
	fi
}

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source "/usr/share/bash-completion/bash_completion"
	elif [ -f /etc/bash_completion ]; then
		source "/etc/bash_completion"
	fi
fi

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_session_setup.sh" ]; then
	source "$HOME/.environment_setup/local_session_setup.sh"
fi

# a little bit of obscurity to keep specifics out of version control
if [ -r "$HOME/.environment_setup/secret_setup.sh" ]; then
	source "$HOME/.environment_setup/secret_setup.sh"
fi

# set +x
# exec 2>&3 3>&-
