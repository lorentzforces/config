### FZF Configuration ###

dark_color_scheme_opts='--color fg:-1,bg:-1,fg+:-1,bg+:8,hl:12,hl+:12,pointer:5,info:14,prompt:13'
light_color_scheme_opts='--color fg:-1,bg:-1,fg+:-1,bg+:7,hl:6,hl+:6,pointer:5,info:6,prompt:1'

# Standard options env var
standard_opts="--tabstop=4"
export FZF_DEFAULT_OPTS="$dark_color_scheme_opts $standard_opts"

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
