### FZF Configuration ###

dark_color_scheme_opts='--color fg:-1,bg:-1,fg+:-1,bg+:8,hl:12,hl+:12,pointer:5,info:14,prompt:13'
light_color_scheme_opts='--color fg:-1,bg:-1,fg+:-1,bg+:7,hl:4,hl+:4,pointer:5,info:6,prompt:1'

# Standard options env var
export FZF_DEFAULT_OPTS="$light_color_scheme_opts"

# use ripgrep to search files
# this will respect .gitignore settings, add --no-ignore to ignore .gitignore
default_command='rg'
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
default_command+=' --files --hidden --follow --ignore-case'
# ignore .git, node_modules, and MacOS metadata
default_command+=' --glob "!.git" --glob "!.DS_STORE" --glob "!node_modules"'

# env var that replaces "find" as the command fzf uses by default
export FZF_DEFAULT_COMMAND="$default_command"
export FZF_CTRL_T_COMMAND="$default_command"

### Functions ###

# TODO: consolidate code styles - this is a mess in here right now

# checkout git branch/tag
function fzf_git_checkout() {
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
function fzf_git_show() {
  git ls --color=always "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '\<[a-f0-9]\+\>' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# cd into directory containing selected file
function fzf_cd_containing_dir() {
   local file
   local dir
   file=$(fzf-tmux -u20 +m -q "$1") && dir=$(dirname "$file")
   [ -n "$dir" ] && cd "$dir"
}

# Select a docker container to start and attach to
function fzf_docker_start() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf-tmux -u20 -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker start "$cid"
}

# Select a running docker container to stop
function fzf_docker_stop() {
  local cid
  cid=$(docker ps | sed 1d | fzf-tmux -u20 -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker stop "$cid"
}

# search file contents
# (experimental)
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages $1 | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 || rg --ignore-case --pretty --context 10 $1 {}"
}
