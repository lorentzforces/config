# homebrew installs to a location that isn't on the PATH by default on apple silicon
export PATH=$(ensure-path "/opt/homebrew/bin")

coreutils_prefix="$(brew --prefix coreutils)"
export PATH=$(ensure-path "${coreutils_prefix}/libexec/gnubin")
export MANPATH=$(echo "$MANPATH" | ensure-path --stdin "${coreutils_prefix}/libexec/gnuman")

# turns out this was in an inconvenient spot in the PATH
export PATH=$(ensure-path "/usr/local/bin")

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/mine/dev-env/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"

source "$HOME/.environment_setup/session_setup.sh"
