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
export PAGER="nvim -R"
export MANPAGER="nvim +Man!"

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

# default options for common commands
alias ls="ls --classify --width=90"
alias rg="rg -i -M300"

# ls abbreviations
alias la="ls -A"
alias ll="ls -Alh"

alias g="git"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# aliases for custom-defined functions
alias fco="fzf_git_checkout"
alias fshow="fzf_git_show"
alias Commits="fzf_git_show"
alias fcd="fzf_cd_containing_dir"
alias Files="fzf_cd_containing_dir"
alias da="fzf_docker_start"
alias ds="fzf_docker_stop"
alias xtrun="run_with_xterminfo"

# paging
alias page="nvim -R -"
alias pageify="fc -s | nvim -R -"
alias lessify="fc -s | less -R" # in case only less is available for some reason

# some handy one-liners
alias printpath='eval "echo $PATH | sed '\''s/:/\n/g'\'' | cat"'

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		source /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	fi
fi
