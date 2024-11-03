RC_PATH="$HOME/.environment_setup/session_setup.sh"
if [[ -r "$RC_PATH" ]]; then
  source "$RC_PATH"
else
  &>2 printf "%s does not exist\n" "$RC_PATH"
  exit 1
fi
