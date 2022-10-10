### FZF setup
# there's a lot of fzf configuration, so that's extracted to another file
# TODO: implement a similar search to the FZF-provided ctrl-t, but for git refs instead of files
if [ -r ~/.environment_setup/fzf_config.sh ]; then
	source ~/.environment_setup/fzf_config.sh
fi

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth

# set the prompt
# for now we assume that our terminal supports xterm color codes
export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\]:) \\[\\033[39m\\]'

# store "host" terminal so we can use the same terminfo in tmux
export HOST_TERM=$TERM

# set up paging env vars
export PAGER="nvim -R -"
export MANPAGER="nvim +Man!"

# point to ripgrep configuration
export RIPGREP_CONFIG_FILE="$HOME/.config/ripgreprc"

# point to ls_colors configuration
eval "$(dircolors -b $HOME/.config/ls-colors.conf)"

# a lot of programs aren't a fan of Kitty's terminfo, so this lets us fake xterm capabilities when
# we need to use them
function run_with_xterminfo() {
	(TERM=xterm-256color; eval "$@")
}
alias xtrun="run_with_xterminfo"

# set up the fast node manager
eval "$(fnm env)"
eval "$(fnm completions --shell bash)"

### aliases ###

alias ls="ls --color=auto --classify --width=90"
alias la="ls -A --color=auto"
alias ll="ls -Alh --color=auto"

alias g="git"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# aliases for fzf-related functions
alias fco="fzf_git_checkout"
alias fshow="fzf_git_show"
alias Commits="fzf_git_show"
alias fcd="fzf_cd_containing_dir"
alias Files="fzf_cd_containing_dir"
alias da="fzf_docker_start"
alias ds="fzf_docker_stop"

# paging
alias page="nvim -R"
alias pageify="fc -s | nvim -R -"
alias lessify="fc -s | less -R" # in case only less is available for some reason

# some handy one-liners
alias printpath='printenv PATH | sed s/:/\\n/g'

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi

# lf alias with directory following (when lf exits, cd to the directory it was in)
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_session_setup.sh" ]; then
	source "$HOME/.environment_setup/local_session_setup.sh"
fi
