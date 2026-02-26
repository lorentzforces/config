# entry point for shell setup

env_setup="$HOME/.environment_setup/base_shell_setup.src.sh"
if [[ -r "$env_setup" ]]; then
	# shellcheck source=/dev/null
	source "$env_setup"
else
	_ltz_print_error "[SHELL] script not found: ${env_setup}"
fi

shell_mode="NONINTERACTIVE"
if [[ $- == *i* ]]; then
	shell_mode="INTERACTIVE"
fi

if [[ "$shell_mode" = "INTERACTIVE" ]]; then
	interactive_setup="$HOME/.environment_setup/interactive_shell_setup.src.sh"
	if [[ -r "$interactive_setup" ]]; then
		# shellcheck source=/dev/null
		source "$interactive_setup"
	else
		_ltz_print_error "[SHELL] script not found: ${interactive_setup}"
	fi

	welcome_script="$HOME/.local/bin/top-line-status"
	_ltz_if_present "$welcome_script"
fi
