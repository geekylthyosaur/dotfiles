#!/bin/sh

while true; do
    read -p "Install amd [1] or intel [2] graphics? " option
    case $option in
        1 ) doas apk add mesa-dri-gallium mesa-va-gallium; break;;
        2 ) doas apk add mesa-dri-gallium libva-intel-driver; break;;
    esac
done

doas apk add firefox chromium
doas apk add alacritty fuzzel helix tmux htop
doas apk add light
doas apk add dbus
doas apk add pipewire pipewire-pulse pipewire-alsa playerctl
doas apk add slurp grim
doas apk add xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-wlr
doas apk add gsettings-desktop-schemas
doas apk add ttf-dejavu

