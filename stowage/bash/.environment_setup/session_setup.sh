# this should be safe to source from whatever profile script gets run - thanks to ensure-path,
# even PATH-modifying operations should be idempotent(ish)

CURRENT_SHELL='BASH'
if [[ -n "$ZSH_VERSION" ]]; then
	CURRENT_SHELL='ZSH'
fi

if [ -r "$HOME/.environment_setup/fzf_config.sh" ]; then
	source "$HOME/.environment_setup/fzf_config.sh"
fi

# I keep hitting ctrl-d to page up and down a la vim, but this closes the terminal by default
setopt ignore_eof
setopt no_case_glob

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt extended_history
setopt share_history
setopt append_history
HISTFILE="$HOME/.cache/zsh/history"
mkdir -p "$(dirname "$HISTFILE")"
HISTSIZE=1000
SAVEHIST=1000

if [[ "$CURRENT_SHELL" = "BASH" ]]; then
	# we assume that our terminal supports xterm color codes
	export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\][BASH] :) \\[\\033[39m\\]'
else
	NEWLINE=$'\n'
	export PS1="%F{red}%~ [zsh] ▸${NEWLINE}%F{cyan}%B%(?.. !%?)%b%F{magenta} :)%F{reset} "
fi

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
alias kc='kubectl'
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

# completion init
autoload -U compinit
compinit

# completion config heavily based on guide at https://thevaluable.dev/zsh-completion-guide-examples/

zstyle ':completion:*' completer _extensions _complete _approximate _complete_help
# TODO: caching doesn't seem to be working (or at least, is not creating this file)
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/completion-cache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# individual completion config must be done after compinit runs
eval "$(fnm completions --shell zsh)"

### per-machine configuration

# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_session_setup.sh" ]; then
	source "$HOME/.environment_setup/local_session_setup.sh"
fi

# a little bit of obscurity to keep specifics out of version control
if [ -r "$HOME/.environment_setup/secret_setup.sh" ]; then
	source "$HOME/.environment_setup/secret_setup.sh"
fi
