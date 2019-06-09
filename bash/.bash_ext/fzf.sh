#
# FZF Configuration
#

#
# Standard options env var
#

export FZF_DEFAULT_OPTS='
	--color fg:-1,bg:-1,fg+:7,bg+:8,hl:12,hl+:12,pointer:5
'

#
# Functions
#

# checkout git branch/tag
fzf_git_checkout() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all --color=always | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf-tmux -u20 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# git commit browser
fzf_git_show() {
  git lsm --color=always "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# cd into directory containing selected file
fzf_cd_containing_dir() {
   local file
   local dir
   file=$(fzf-tmux -u20 +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# Select a docker container to start and attach to
function fzf_docker_start() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf-tmux -u20 -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid"
}

# Select a running docker container to stop
function fzf_docker_stop() {
  local cid
  cid=$(docker ps | sed 1d | fzf-tmux -u20 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

