# Sdkman init doesn't work in .profile because it initializes itself as a set of functions, which
# are not passed into subshells. In other words, this needs to be done at each session startup.

# remove existing SDKMAN paths in case we're inheriting the PATH (ex: starting a tmux session)
# TODO: change ensure-path so we can just delete entries without having to add one
# PATH=$(ensure-path -d "sdkman/candidates")

export SDKMAN_DIR="$HOME/mine/programs/sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

work_build_setup="$HOME/mine/dev-env/setup-work-build-env.sh"
if [[ -r "$work_build_setup" ]]; then
	source "$work_build_setup"
else
	>&2 printf "==SHELL== work build env declaration not found at %s" "$work_build_setup"
fi

KUBECONFIG=$(find ~/.kube/config* | tr '\n' ':' | sed s/:$//)
export KUBECONFIG
