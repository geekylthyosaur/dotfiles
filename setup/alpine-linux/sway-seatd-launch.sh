#!/bin/sh

mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR=/tmp/user/$(id -u)

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

export QT_QPA_PLATFORM="wayland-egl"
export MOZ_ENABLE_WAYLAND="1"

exec seatd-launch -- dbus-run-session -- sway

