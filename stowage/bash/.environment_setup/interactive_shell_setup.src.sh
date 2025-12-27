# this should be safe to source from whatever profile script gets run - thanks to ensure-path,
# even PATH-modifying operations should be idempotent(ish)

# NOTE: RE: #shellcheck source=/dev/null
# We avoid shellcheck sourcing across a lot of script locations since not all of these files will
# exist on all installations, and a lot of the paths are parametrized anyway.

fzf_config="$HOME/.environment_setup/fzf_config.src.sh"
if [[ -r "$fzf_config" ]]; then
	# shellcheck source=/dev/null
	source "$fzf_config"
else
	_ltz_print_error "[SHELL] script not found: ${fzf_config}"
fi

# I keep hitting ctrl-d to page up and down a la vim, but this closes the terminal by default
set -o ignoreeof

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth
# use timestamps with history
HISTTIMEFORMAT="%F %T " # trailing space is important

# shellcheck source=/dev/null
source "$HOME/.environment_setup/prompt_cmd_setup.src.sh"
export PROMPT_COMMAND="__prompt_cmd"

# store "host" terminal so we can use the same terminfo in tmux
export HOST_TERM=$TERM

GPG_TTY=$(tty)
export GPG_TTY

export PAGER="nvim -R -"
export MANPAGER="nvim +Man!"
export MANWIDTH="120"
export LESS="-R --tabs=4"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
export TMUXP_CONFIGDIR="$HOME/.config/tmuxp"
export GOPATH="$HOME/.go"
export K9S_CONFIG_DIR="$HOME/.config/k9s"

export CHCK_CHNG_REVS="origin/main:origin/master"
export UPDATE_LIST_OUTPUT_FILE="$HOME_MINE/updatable-packages.txt"

eval "$(dircolors --bourne-shell "$HOME"/.config/ls-colors.conf)"

eval "$(fnm env)"
# fix path after fnm chucks new stuff on it
PATH=$(ensure-path --delete "fnm_multishells" "${FNM_MULTISHELL_PATH}/bin")
export PATH

### enable programmable completion features

# This path is correct for OpenSUSE.
DEFAULT_GIT_COMPLETION_PATH="/usr/share/bash-completion/completions/git"
if [[ -r "$DEFAULT_GIT_COMPLETION_PATH" ]]; then
	# shellcheck source=/dev/null
	source "$DEFAULT_GIT_COMPLETION_PATH"
fi

if type brew &>/dev/null; then
	HOMEBREW_PREFIX="$(brew --prefix)"
BREW_BASH_COMPLETION_PATH="${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
	if [[ -r "$BREW_BASH_COMPLETION_PATH" ]]; then
		# shellcheck source=/dev/null
		source "$BREW_BASH_COMPLETION_PATH"
	else
		for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
			# shellcheck source=/dev/null
			[[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
		done
	fi
fi

### aliases

alias ls='ls --color=auto --group-directories-first --classify --width=90'
# following inherit options from the above "ls" alias
alias la='ls -A'
alias ll='ls -Aoh --time-style=long-iso'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdm='cd $HOME_MINE'

alias topline='top-line-status'

alias g='git'
__git_complete g __git_main
alias kc='kubectl'
alias gco='git-checkout-fuzzy'
alias gdash='git-dash'
alias fshow='git-log-fuzzy-search'
__git_complete fshow _git_log
alias delete-branch='git-delete-branch-fuzzy'

alias jshow='jj-log-fuzzy-search'

alias fcd='cd $(fzf_containing_dir)'
alias fif='fzf_find_in_files'

alias tmux-default='tmuxp load --yes $HOME/.config/tmuxp/default.yaml'
alias tmuxhere='tmuxp-current-dir'
alias cdt='cd $(tmux display-message -p "#{session_path}")'
alias tmux-build-windows='tmux-add-windows build run'

alias page='nvim -R'
alias pageify='fc -s | nvim -R -'
alias lessify='fc -s | less -R'
alias restow='stow -R --no-folding'
alias printpath='printenv PATH | sed s/:/\\n/g'
alias reporoot='cd $(repo-root-dir)'

# lf alias with directory following (when lf exits, cd to the directory it was in)
fd() {
	local tmp
	tmp="$(mktemp --tmpdir 'lf_fd.XXXXX')"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		local dir
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [[ -d "$dir" && "$dir" != "$(pwd)" ]]; then
			cd "$dir" || { _ltz_print_error "cd to $dir failed" exit 1; }
		fi
	fi
}

kctx() {
	KUBECONFIG=$(switcher-context-fuzzy "$1")
	export KUBECONFIG
}

awsp() {
	AWS_PROFILE=$(aws-profile-fuzzy "$1")
	export AWS_PROFILE
	_ltz_print_progress "AWS Profile: $AWS_PROFILE"
}

### per-machine configuration
# we do this last so we can override anything per-machine
local_interactive_src_file="$HOME/.environment_setup/interactive_shell_setup_local.src.sh"
if [[ -r "$local_interactive_src_file" ]]; then
	# shellcheck source=/dev/null
	source "$local_interactive_src_file"
fi

# a little bit of obscurity to keep specifics out of version control
secret_setup_src_file="$HOME/.environment_setup/secret_setup.src.sh"
if [[ -r "$secret_setup_src_file" ]]; then
	# shellcheck source=/dev/null
	source "$secret_setup_src_file"
fi
