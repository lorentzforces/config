autoload -U compinit
compinit

# config heavily based on guide at https://thevaluable.dev/zsh-completion-guide-examples/

zstyle ':completion:*' completer _extensions _complete _approximate _complete_help
# TODO: caching doesn't seem to be working (or at least, is not creating this file)
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/completion-cache"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
