# default options for common commands
alias ls="ls --classify --width=90"
alias rg="rg -i -M300"

# ls abbreviations
alias la="ls -A"
alias ll="ls -alh"

alias g="git"
alias ..="cd .."
alias ...="cd ../.."
alias home="cd $CLEAN_HOME"
alias hm="home"

# aliases for custom-defined functions
alias fco="fzf_git_checkout"
alias fshow="fzf_git_show"
alias Commits="fzf_git_show"
alias fcd="fzf_cd_containing_dir"
alias Files="fzf_cd_containing_dir"
alias da="fzf_docker_start"
alias ds="fzf_docker_stop"
alias xtrun="run_with_xterminfo"

# oh crap I wasn't expecting that much output
alias lessify="fc -s | less -R"

alias bigly="du -sh"
