#
# Miscellaneous commands for general convenience
#

function run_with_xterminfo() {
  (TERM=xterm-256color; eval "$@")
}
