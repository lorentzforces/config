# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.
export SDKMAN_DIR="$HOME/mine/programs/sdkman"
# shellcheck source=/dev/null
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Make tools aware of ssh-agent running
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
