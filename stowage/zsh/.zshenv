PROFILE_PATH="$HOME/.environment_setup/profile_setup.sh"
if [[ -r "$PROFILE_PATH" ]]; then
  source "$PROFILE_PATH"
else
  &>2 printf "%s does not exist\n" "$PROFILE_PATH"
  exit 1
fi
