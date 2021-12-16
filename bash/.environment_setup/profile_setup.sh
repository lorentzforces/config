# if we're in tmux, this has already been loaded

export EDITOR=nvim

### PATH building ###
# personal location for unpackaged programs
export PATH="$HOME/programs/bin:$PATH"

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_profile_setup.sh" ]; then
	source "$HOME/.environment_setup/local_profile_setup.sh"
fi
