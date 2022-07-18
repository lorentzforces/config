brew_prefix="$(brew --prefix coreutils)"
export PATH="${brew_prefix}/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="${brew_prefix}/libexec/gnubin:/usr/local/bin:$MANPATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

source $HOME/.environment_setup/session_setup.sh
