#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# assemble my custom PS1 (but in a way that's understandable)

red='\[\033[31m\]'
# in my typical color scheme the terminal color "purple" corresponds to orange
purple='\[\033[35m\]'
reset='\[\033[39m\]'

prompt=''
prompt+=$red
prompt+="\w ▸\n"
prompt+=$purple
prompt+=" :) "
prompt+=$reset

echo -En "$prompt"
