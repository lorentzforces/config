# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

if [ -r ~/.environment_setup/fzf_config.sh ]; then
	source ~/.environment_setup/fzf_config.sh
fi

# I keep hitting ctrl-d to page up and down a la vim, but this closes the terminal by default
set -o ignoreeof

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth

# we assume that our terminal supports xterm color codes
export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\]:) \\[\\033[39m\\]'

# store "host" terminal so we can use the same terminfo in tmux
export HOST_TERM=$TERM

export PAGER="nvim -R -"
export MANPAGER="nvim +Man!"
export LESS="-R --tabs=4"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

export TMUXP_CONFIGDIR="$HOME/.config/tmuxp"

eval "$(dircolors -b $HOME/.config/ls-colors.conf)"

# a lot of programs aren't a fan of terminfo from terminals that aren't the "standard" selections,
# so this lets us fake xterm capabilities when we need to use them
function run_with_xterminfo() {
	(TERM=xterm-256color; eval "$@")
}
alias xtrun="run_with_xterminfo"

eval "$(fnm env)"
eval "$(fnm completions --shell bash)"

# expects 1 argument which is the prompt text
function _confirm() {
	read -p "$1 " -n 1 -r
	printf "\n" # move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		return 1
	fi
}

### aliases ###

alias ls="ls --color=auto --group-directories-first --classify --width=90"
alias la="ls -A --group-directories-first --color=auto"
alias ll="ls -Alh --group-directories-first --color=auto"

alias g="git"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

function gco() {
	local target
	target=$(_fzf_git_branches)

	if [ -z "$target" ]; then
		return 1
	else
		git checkout "$target"
	fi
}

function delete-branch() {
	local target
	target=$(_fzf_git_branches)

	if [ -z "$target" ]; then
		return 1
	else
		_confirm "Are you sure you want to delete branch: $target? " || return
		git branch -d "$target"
	fi
}

alias fshow="_fzf_git_show"
alias fcd="_fzf_cd_containing_dir"

alias page="nvim -R"
alias pageify="fc -s | nvim -R -"
alias lessify="fc -s | less -R"

alias printpath='printenv PATH | sed s/:/\\n/g'

# lf alias with directory following (when lf exits, cd to the directory it was in)
function fd() {
	local tmp
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		local dir
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [[ -d "$dir" && "$dir" != "$(pwd)" ]]; then
			cd "$dir"
		fi
	fi
}

function fdev() {
	local dev_dir
	dev_dir=$(_fzf_directories_at "$HOME/mine/repos")

	if [ -z "$dev_dir" ]; then
		return 1
	else
		local dev_name
		dev_name=$(basename "$dev_dir")
		>&2 echo "dev_dir: $dev_dir, dev_name: $dev_name"
		DEV_DIR="$dev_dir" DEV_NAME="$dev_name" tmuxp load --yes dev
	fi
}

function fmux() {
	local tmuxp_file
	tmuxp_file=$(
		tmuxp ls \
		| rg -v "dev" \
		| fzf-tmux -u20 -- --no-hscroll --ansi --no-multi
	)
	# the "dev" config is special and should not be chooseable here

	if [ -z "tmuxp_file" ]; then
		return 1
	else
		tmuxp load --yes "$tmuxp_file"
	fi
}

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_session_setup.sh" ]; then
	source "$HOME/.environment_setup/local_session_setup.sh"
fi

# set +x
# exec 2>&3 3>&-
