# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.

# remove existing SDKMAN paths in case we're inheriting the PATH (ex: starting a tmux session)
# TODO: change ensure-path so we can just delete entries without having to add one
# PATH=$(ensure-path -d "sdkman/candidates")

export SDKMAN_DIR="$HOME/mine/programs/sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

if [[ -r "$HOME/mine/dev-env/setup-work-build-env.sh" ]]; then
	source "$HOME/mine/dev-env/setup-work-build-env.sh"
fi

KUBECONFIG=$(find ~/.kube/config* | tr '\n' ':' | sed s/:$//)
export KUBECONFIG
