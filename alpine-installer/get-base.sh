#!/bin/sh

while true; do
    read -p "Install amd [1] or intel [2]? " option
    case $option in
        1 ) doas apk add mesa-ati-dri mesa-dri-gallium mesa-va-gallium; break;;
        2 ) ; break;;
    esac
done


doas apk add foot fuzzel neovim tmux htop \
    grim playerctl light \
    dbus polkit \
    pipewire pipewire-alsa libpipewire0.2 \
    xdg-desktop-portal xdg-desktop-portal-wlr v4l2loopback gstreamer1-pipewire slurp \
    gsetting-desktop-schemas \
    ttf-dejavu

