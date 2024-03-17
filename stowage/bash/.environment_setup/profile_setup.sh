# if we're in tmux, this has already been loaded

# export editor because some programs that won't source .bashrc will read it
export EDITOR=nvim

### PATH building ###
# personal location for unpackaged programs
# we need to set this the old-fashioned way to bootstrap where we usually put the ensure-path
# command
export PATH="$HOME/mine/programs/bin:$PATH"

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_profile_setup.sh" ]; then
	source "$HOME/.environment_setup/local_profile_setup.sh"
fi

# move this to the front of PATH so our own programs take ultimate precedence
export PATH=$(ensure-path "$HOME/mine/programs/bin")
