# homebrew installs to a location that isn't on the PATH by default on apple silicon
export PATH="/opt/homebrew/bin:$PATH"

coreutils_prefix="$(brew --prefix coreutils)"
export PATH="${coreutils_prefix}/libexec/gnubin:$PATH"
export MANPATH="${coreutils_prefix}/libexec/gnuman:$MANPATH"

export PATH="/usr/local/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/mine/dev-env/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"

source $HOME/.environment_setup/session_setup.sh
