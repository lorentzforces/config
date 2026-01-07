#!/usr/bin/env bash
set -u

# Assumes:
# - selfman config files are present (i.e. after a stow operation)
# - go on the PATH
# - git on the PATH
# - make on the PATH

TMP_BOOTSTRAP_DIR="/tmp/selfman-bootstrap"

main() {
	git clone "https://github.com/lorentzforces/selfman.git" "$TMP_BOOTSTRAP_DIR" \
		|| { >&2 echo "failed to clone selfman"; return 1; }
	pushd "$TMP_BOOTSTRAP_DIR" || { >&2 echo "failed to change to temp dir"; return 1; }

	make build || { >&2 echo "failed to build selfman"; return 1; }

	./selfman make-it-so selfman || { >&2 echo "selfman bootstrap step failed"; return 1; }

	if ! &>/dev/null type -t "selfman"; then
		>&2 echo "selfman not available after bootstrapping"
		return 1
	fi

	>&2 echo "removing temp dir..."
	rm -rf "$TMP_BOOTSTRAP_DIR"

	&>/dev/null popd || { >&2 echo "returning to original dir failed"; return 1; }

	echo ""
	selfman list
}
main
