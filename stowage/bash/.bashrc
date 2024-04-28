# not necessarily sourced, and we depend on env var values (particularly PATH) to be set for
# session setu
if [ -r "$HOME/.environment_setup/profile_setup.sh" ]; then
  source "$HOME/.environment_setup/profile_setup.sh"
fi

if [ -r "$HOME/.environment_setup/session_setup.sh" ]; then
  source "$HOME/.environment_setup/session_setup.sh"
fi
