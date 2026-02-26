# I previously moved this to a more prominent PATH location, but I forgot why, and now I want
# homebrew to take precedence
PATH=${ ensure-path "/usr/local/bin"; }
# homebrew installs to a location that isn't on the PATH by default on apple silicon
PATH=${ ensure-path "/opt/homebrew/bin"; }

coreutils_prefix=${ brew --prefix coreutils; }
PATH=${ ensure-path "${coreutils_prefix}/libexec/gnubin"; }
MANPATH=${ echo -n "$MANPATH" | ensure-path --stdin --keep-empty "${coreutils_prefix}/libexec/gnuman"; }
make_prefix=${ brew --prefix make; }
PATH=${ ensure-path "${make_prefix}/libexec/gnubin";  }
MANPATH=${ echo -n "$MANPATH" | ensure-path --stdin --keep-empty "${make_prefix}/libexec/gnuman"; }

export PATH
export MANPATH

export BASH_SILENCE_DEPRECATION_WARNING=1

export HELM_LOCAL_VALUES="$HOME/.config/phaedon/helm-tag-values-override.yaml"
export K9SCONFIG="$HOME/.config/k9s"
