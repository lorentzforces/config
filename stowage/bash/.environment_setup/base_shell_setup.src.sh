export EDITOR=nvim

# our own dir structure, referenced by other commands
HOME_MINE="$HOME/mine"
export HOME_MINE

### PATH building ###
# personal location for unpackaged programs
# we need to set this the old-fashioned way to bootstrap where we usually put the ensure-path
# command
PATH="$HOME/.local/bin:$PATH"
export PATH

PATH=$(ensure-path "$HOME/.go/bin")

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/base_shell_setup_local.src.sh" ]; then
	# shellcheck source=/dev/null
	source "$HOME/.environment_setup/base_shell_setup_local.src.sh"
fi

PATH=$(ensure-path "$HOME_MINE/programs/bin")
# move this to the front of PATH so our own programs take ultimate precedence
PATH=$(ensure-path "$HOME/.local/bin")
export PATH
