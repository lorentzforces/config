RC_PATH="$HOME/.environment_setup/session_setup.sh"
if [[ -r "$RC_PATH" ]]; then
	source "$RC_PATH"
else
	>&2 printf "%s does not exist\n" "$RC_PATH"
fi

COMPLETION_PATH="$HOME/.environment_setup/completion_setup.zsh"
if [[ -r "$COMPLETION_PATH" ]]; then
	source "$COMPLETION_PATH"
else
	>&2 printf "%s does not exist\n" "$COMPLETION_PATH"
fi
