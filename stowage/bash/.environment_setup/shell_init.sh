# entry point for shell setup

shell_mode="NONINTERACTIVE"
if [[ $- == *i* ]]
then
    shell_mode="INTERACTIVE"
fi

env_setup="$HOME/.environment_setup/base_shell_setup.sh"
if [[ -r "$env_setup" ]]; then
	# shellcheck source=/dev/null
	source "$env_setup"
else
	>&2 printf "==SHELL== script not found: %s\n" "$env_setup"
fi

interactive_setup="$HOME/.environment_setup/interactive_shell_setup.sh"
if [[ "$shell_mode" = "INTERACTIVE" ]]; then
	if [[ -r "$interactive_setup" ]]; then
		# shellcheck source=/dev/null
		source "$interactive_setup"
	else
		>&2 printf "==SHELL== script not found: %s\n" "$interactive_setup"
	fi

fi

# IF INTERACTIVE, display welcome message
