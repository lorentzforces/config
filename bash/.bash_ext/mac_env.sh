brew_prefix="$(brew --prefix coreutils)"
export PATH="${brew_prefix}/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="${brew_prefix}/libexec/gnubin:/usr/local/bin:$MANPATH"
unset brew_prefix
