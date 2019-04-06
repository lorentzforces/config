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
  export PS1=$'\\[\\033[36m\\]\\D{%m/%d/%Y} \\t > \\[\\033[91m\\]\\u@\\h > \\[\\033[35m\\]\\w >\\n \\[\\033[91m\\]:) \\[\\033[39m\\]'
else
  export PS1=$'\\D{%m/%d/%Y} \\t > \\u@\\h > \\w >\\n :) '
fi

unset color_prompt

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# to turn off any of the .bash_ext/ scripts, do not symlink them
if [ -r ~/.bash_ext/nvm_init.sh ]; then
  source ~/.bash_ext/nvm_init.sh
fi

if [ -r ~/.bash_ext/fzf_func.sh ]; then
  source ~/.bash_ext/fzf_func.sh
fi

