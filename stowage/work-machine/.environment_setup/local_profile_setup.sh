# homebrew installs to a location that isn't on the PATH by default on apple silicon
export PATH=$(ensure-path "/opt/homebrew/bin")

coreutils_prefix="$(brew --prefix coreutils)"
export PATH=$(ensure-path "${coreutils_prefix}/libexec/gnubin")
export MANPATH=$(echo -n "$MANPATH" | ensure-path --stdin "${coreutils_prefix}/libexec/gnuman")
# manpath expects an empty entry to denote the "default" manpath. This may be temporary, and
# ensure-path may be updated to conditionally allow empty entries.
# see the man entry for manpath
export MANPATH="$MANPATH:"

# turns out this was in an inconvenient spot in the PATH
export PATH=$(ensure-path "/usr/local/bin")

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/mine/dev-env/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"

source "$HOME/.environment_setup/session_setup.sh"
