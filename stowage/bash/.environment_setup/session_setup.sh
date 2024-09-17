# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# this should be safe to source from whatever profile script gets run - thanks to ensure-path,
# even PATH-modifying operations should be idempotent

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

export GPG_TTY=$(tty)

export PAGER="nvim -R -"
export MANPAGER="nvim +Man!"
export MANWIDTH="120"
export LESS="-R --tabs=4"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
export TMUXP_CONFIGDIR="$HOME/.config/tmuxp"
export GOPATH="$HOME/.go"
export K9S_CONFIG_DIR="$HOME/.config/k9s"

export CHCK_CHNG_REVS="origin/main:origin/master"

eval "$(dircolors -b "$HOME"/.config/ls-colors.conf)"

eval "$(fnm env)"
eval "$(fnm completions --shell bash)"

# fix path after fnm chucks new stuff on it
PATH=$(ensure-path -d "fnm_multishells" "${FNM_MULTISHELL_PATH}/bin")
export PATH

alias ls='ls --color=auto --group-directories-first --classify --width=90'
alias la='ls -A --group-directories-first --color=auto'
alias ll='ls -Alh --group-directories-first --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdm='cd $HOME_MINE'

alias g='git'
# TODO: change this script name from checkout->switch
alias gco='git-checkout-fuzzy'
alias fshow='git-log-fuzzy-search'
alias delete-branch='git-delete-branch-fuzzy'

alias fcd='cd $(fzf_containing_dir)'
alias fif='fzf_find_in_files'

alias tmuxhere='tmuxp-current-dir'
alias fdev='tmuxp-session-dev-dirs'
alias fmux='tmuxp-defined-sessions'

alias kctx='kube-context-fuzzy'

alias page='nvim -R'
alias pageify='fc -s | nvim -R -'
alias lessify='fc -s | less -R'
alias restow='stow -R --no-folding'
alias printpath='printenv PATH | sed s/:/\\n/g'
alias reporoot='cd $(git rev-parse --show-toplevel)'

# lf alias with directory following (when lf exits, cd to the directory it was in)
function fd()
{
	local tmp
	tmp="$(mktemp --tmpdir 'lf_fd.XXXXX')"
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
