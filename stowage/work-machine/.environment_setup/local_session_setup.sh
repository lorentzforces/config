# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.
export SDKMAN_DIR="$HOME/mine/programs/sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

if [[ -r "$HOME/mine/dev-env/setup-work-build-env.sh" ]]; then
	source "$HOME/mine/dev-env/setup-work-build-env.sh"
fi

KUBECONFIG=$(find ~/.kube/config* | tr '\n' ':' | sed s/:$//)
export KUBECONFIG
