autoload -U compinit
compinit

# config heavily based on guide at https://thevaluable.dev/zsh-completion-guide-examples/

zstyle ':completion:*' completer _extensions _complete _approximate _complete_help
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/completion-cache"
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
