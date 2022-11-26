#!/bin/sh

while true; do
    read -p "Install amd [1] or intel [2]? " option
    case $option in
        1 ) doas apk add mesa-dri-ati mesa-dri-gallium mesa-va-gallium; break;;
        2 ) ; break;;
    esac
done

doas apk add alacritty fuzzel neovim tmux htop
doas apk add light
doas apk add dbus
doas apk add pipewire pipewire-alsa playerctl
doas apk add slurp grim
doas apk add xdg-desktop-portal xdg-desktop-portal-wlr
doas apk add gsettings-desktop-schemas
doas apk add ttf-dejavu

