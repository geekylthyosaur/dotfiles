#!/bin/sh

while true; do
    read -p "Install amd [1] or intel [2]? " option
    case $option in
        1 ) doas apk add mesa-ati-dri mesa-dri-gallium mesa-va-gallium; break;;
        2 ) ; break;;
    esac
done

doas apk add foot fuzzel neovim tmux htop \ # Basic utilities
    light \ # Screen brightness control
    dbus \ # Required utilities
    pipewire pipewire-alsa playerctl \ # Sound
    slurp grim \ # Screenshots
    xdg-desktop-portal xdg-desktop-portal-wlr v4l2loopback gstreamer1-pipewire libpipewire0.2 \ # Screen sharing
    gsetting-desktop-schemas \ # Cursor theme
    ttf-dejavu # Fonts

