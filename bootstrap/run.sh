#!/bin/sh

set -euo pipefail

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS="$ROOTDIR/hosts"
PLAYBOOK="$ROOTDIR/playbook.yaml"

XDG_CONFIG_HOME="$HOME/.config"

sudo dnf install ansible -y

ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass -e "ROOTDIR=$ROOTDIR" -e "XDG_CONFIG_HOME=$XDG_CONFIG_HOME"
