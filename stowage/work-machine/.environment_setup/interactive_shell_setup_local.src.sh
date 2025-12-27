# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.

export SDKMAN_DIR="$HOME/mine/programs/sdkman"
# shellcheck source=/dev/null
source "$SDKMAN_DIR/bin/sdkman-init.sh"

work_build_setup="$HOME/mine/dev-env/work-interactive-shell-setup.src.sh"
if [[ -r "$work_build_setup" ]]; then
	# shellcheck source=/dev/null
	source "$work_build_setup"
else
	_ltz_print_error "==SHELL== work setup script not found at ${work_build_setup}"
fi
