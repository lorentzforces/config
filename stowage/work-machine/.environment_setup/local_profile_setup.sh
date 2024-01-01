# homebrew installs to a location that isn't on the PATH by default on apple silicon
export PATH=$(ensure-path --first --from-env "/opt/homebrew/bin")

coreutils_prefix="$(brew --prefix coreutils)"
export PATH=$(ensure-path --first --from-env "${coreutils_prefix}/libexec/gnubin")
export MANPATH=$(echo $MANPATH | ensure-path --first "${coreutils_prefix}/libexec/gnuman")

export PATH=$(ensure-path --first --from-env "/usr/local/bin")

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/mine/dev-env/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"

source $HOME/.environment_setup/session_setup.sh
