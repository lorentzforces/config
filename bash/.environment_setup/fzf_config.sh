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

function _fzf_git_branches() {
	local tags branches target

	tags=$(
		git tag \
		| awk '{print "\x1b[31;1mtag\x1b[m\t" $1}'
	) || return 1

	branches=$(
		git branch --all --color=always \
		| grep -v HEAD \
		| sed "s/.* //" \
		| sed "s#remotes/##" \
		| awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}'
	) || return 1

	target=$(
		(printf "$branches"; printf "$tags") \
		| fzf-tmux -u20 -- --no-hscroll --ansi --no-multi -d "\t" -n 2
	) || return 1

	echo $(echo "$target" | awk '{print $2}')
}

# git commit browser
function _fzf_git_show() {
	git ls --color=always "$@" |
	fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
		--bind "ctrl-m:execute: \
			printf {} \
			| ( \
				grep -o '\<[a-f0-9]\+\>' \
				| head -1 \
				| xargs -I % sh -c 'git show --color=never % \
				| nvim -R -'
			)"
}

# cd into directory containing selected file
function _fzf_cd_containing_dir() {
	local file, dir
	file=$(fzf-tmux -u20 +m -q "$1") && dir=$(dirname "$file")
	[ -n "$dir" ] && cd "$dir"
}

# expects 1 argument: a path to a directory containing files we want to select
function _fzf_files_at() {
	local containing_dir
	containing_dir="$1"

	>&2 echo "finding in $containing_dir"

	local candidates, target
	candidates=$(find -L $containing_dir -mindepth 1 -maxdepth 1 -type f)
	>&2 echo "$candidates"
	target=$(echo "$candidates" | fzf-tmux -u20 -- --no-hscroll --ansi --no-multi) || return 1

	echo "$target"
}

# expects 1 argument: a path to a directory containing directories we want to select
function _fzf_directories_at() {
	local containing_dir
	containing_dir="$1"

	local target
	target=$(
		find -L $containing_dir -mindepth 1 -maxdepth 1 -type d -exec basename {} \; \
		| fzf-tmux -u20 -- --no-hscroll --ansi --no-multi
	) || return 1

	echo "$target"
}

# search file contents
# (experimental)
function fif() {
	if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi

	rg --files-with-matches --no-messages $1 \
	| fzf --preview "highlight -O ansi -l {} 2> /dev/null | \
		rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 $1 \
		|| rg --ignore-case --pretty --context 10 $1 {}"
}
