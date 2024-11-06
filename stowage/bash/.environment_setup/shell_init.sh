# entry point for shell setup

shell_mode="NONINTERACTIVE"
if [[ $- == *i* ]]
then
    shell_mode="INTERACTIVE"
fi

# TODO: change the name of this script
env_setup="$HOME/.environment_setup/profile_setup.sh"
if [[ -r "$env_setup" ]]; then
	# shellcheck source=/dev/null
	source "$env_setup"
else
	>&2 printf "==shell== script not found: \"%s\"" "$env_setup"
fi

# TODO: change the name of this script
interactive_setup="$HOME/.environment_setup/session_setup.sh"
if [[ "$shell_mode" = "INTERACTIVE" ]]; then
	if [[ -r "$interactive_setup" ]]; then
		# shellcheck source=/dev/null
		source "$interactive_setup"
	else
		>&2 printf "==shell== script not found: \"%s\"" "$interactive_setup"
	fi

fi

# IF INTERACTIVE, display welcome message
