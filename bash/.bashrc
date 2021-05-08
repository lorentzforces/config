# PROFILING
# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# to turn off any of the .bash_ext/ scripts, do not symlink them
# set up nvm aliases even if in a non-interactive shell
if [ -r ~/.bash_ext/nvm_init.sh ]; then
  source ~/.bash_ext/nvm_init.sh
fi

# exit if running non-interactively
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with spaces in the history
HISTCONTROL=ignoreboth

# for now we assume that our terminal supports xterm color codes
export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\]:) \\[\\033[39m\\]'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export EDITOR=nvim

# store "host" terminal to use same terminfo in tmux
export HOST_TERM=$TERM

# TODO: consider putting self-managed stuff somewhere else (consistent)
export PATH=~/.fzf/bin:$PATH

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/mac_env.sh ]; then
  source ~/.bash_ext/mac_env.sh
fi

if [ -r ~/.bash_ext/fzf.sh ]; then
  source ~/.bash_ext/fzf.sh
fi

if [ -r ~/.bash_ext/misc_commands.sh ]; then
  source ~/.bash_ext/misc_commands.sh
fi

# local_env.sh should not be committed, it contains machine-specific
# configuration (e.g. homebrew path info)
if [ -r ~/.bash_ext/local_env.sh ]; then
  source ~/.bash_ext/local_env.sh
fi

# PROFILING
# set +x
# exec 2>&3 3>&-

# anything below this point is probably automatically added by some program or another
# and is more trouble to delete than just letting it be here

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
