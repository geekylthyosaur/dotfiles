#!/usr/bin/env bash

set -euo pipefail

ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS="$ROOTDIR/hosts"
PLAYBOOK="$ROOTDIR/playbook.yaml"

export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR"

sudo dnf install ansible -y

ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass -e "ROOTDIR=$ROOTDIR"
