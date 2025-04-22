# entry point for shell setup

env_setup="$HOME/.environment_setup/base_shell_setup.sh"
if [[ -r "$env_setup" ]]; then
	# shellcheck source=/dev/null
	source "$env_setup"
else
	>&2 printf "==SHELL== script not found: %s\n" "$env_setup"
fi

shell_mode="NONINTERACTIVE"
if [[ $- == *i* ]]; then
	shell_mode="INTERACTIVE"
fi

if [[ "$shell_mode" = "INTERACTIVE" ]]; then
	interactive_setup="$HOME/.environment_setup/interactive_shell_setup.sh"
	if [[ -r "$interactive_setup" ]]; then
		# shellcheck source=/dev/null
		source "$interactive_setup"
	else
		>&2 printf "==SHELL== script not found: %s\n" "$interactive_setup"
	fi

	welcome_script="$HOME/.local/bin/top-line-status"
	if [[ -r "$welcome_script" ]]; then
		$welcome_script
	else
		>&2 printf "==SHELL== script not found: %s\n" "$welcome_script"
	fi
fi
