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

# fancy color prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  color_prompt=yes
else
  color_prompt=no
fi

if [ "$color_prompt" = "yes" ]; then
  export PS1=$'\\[\\033[31m\\]\\w ▸\\n \\[\\033[35m\\]:) \\[\\033[39m\\]'
else
  export PS1=$'\\w >\\n :) '
fi

unset color_prompt

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

export PATH=~/.fzf/bin:$PATH

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/mac_env.sh ]; then
  source ~/.bash_ext/mac_env.sh
fi

if [ -r ~/.bash_ext/fzf.sh ]; then
  source ~/.bash_ext/fzf.sh
fi

# PROFILING
# set +x
# exec 2>&3 3>&-
