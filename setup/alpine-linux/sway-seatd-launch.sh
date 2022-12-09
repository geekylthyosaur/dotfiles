#!/bin/sh

export XDG_RUNTIME_DIR=/tmp/user/$(id -u)
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

exec seatd-launch -- dbus-run-session -- sway

