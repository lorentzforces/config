# if we're in tmux, this has already been loaded

# export editor because some programs that won't source .bashrc will read it
export EDITOR=nvim

### PATH building ###
# personal location for unpackaged programs
export PATH=$(ensure-path --first --from-env "$HOME/programs/bin")

### per-machine configuration
# we do this last so we can override anything per-machine
if [ -r "$HOME/.environment_setup/local_profile_setup.sh" ]; then
	source "$HOME/.environment_setup/local_profile_setup.sh"
fi
