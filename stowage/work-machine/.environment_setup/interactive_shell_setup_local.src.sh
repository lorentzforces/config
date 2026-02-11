# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.

export SDKMAN_DIR="$HOME/.local/share/sdkman"
# shellcheck source=/dev/null
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Some things will not be added to public-facing version control.
private_work_shell_setup="$HOME/.environment_setup/work-interactive-shell-setup.src.sh"
if [[ -r "$private_work_shell_setup" ]]; then
	# shellcheck source=/dev/null
	source "$private_work_shell_setup"
else
	_ltz_print_error "==SHELL== work setup script not found at ${private_work_shell_setup}"
fi
