#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Assumes:
# - selfman config files are present (i.e. after a stow operation)
# - go on the PATH
# - git on the PATH
# - make on the PATH

TMP_BOOTSTRAP_DIR="/tmp/selfman-bootstrap"

main() {
	git clone "https://github.com/lorentzforces/selfman.git" "$TMP_BOOTSTRAP_DIR"
	pushd "$TMP_BOOTSTRAP_DIR"

	make build

	./selfman install selfman

	set +e
	type -t "selfman" &>/dev/null
	local exitval=$?
	set -e
	if [[ $exitval != 0 ]]; then
		>&2 echo "selfman not available"
		exit 1
	fi

	>&2 echo "removing temp dir..."
	rm -rf "$TMP_BOOTSTRAP_DIR"

	&>/dev/null popd

	echo ""
	selfman list
}
main
