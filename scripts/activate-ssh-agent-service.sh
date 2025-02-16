#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# activate the ssh-agent systemd user service added by that stow target

systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent
