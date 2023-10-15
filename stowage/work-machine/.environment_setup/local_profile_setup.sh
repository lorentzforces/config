# homebrew installs to a location that isn't on the PATH by default on apple silicon
export PATH="/opt/homebrew/bin:$PATH"
brew_prefix="$(brew --prefix coreutils)"
export PATH="${brew_prefix}/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="${brew_prefix}/libexec/gnuman:/usr/local/bin:$MANPATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/mine/dev-env/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"

source $HOME/.environment_setup/session_setup.sh
