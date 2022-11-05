#!/bin/sh

doas apk add foot fuzzel neovim tmux htop \
    grim playerctl light \
    dbus polkit mesa-ati-dri mesa-dri-gallium mesa-va-gallium \
    pipewire pipewire-alsa libpipewire0.2 \
    xdg-desktop-portal xdg-desktop-portal-wlr v4l2loopback gstreamer1-pipewire slurp \
    gsetting-desktop-schemas \
    ttf-dejavu

doas ln -s /etc/sv/dbus /var/service/
doas ln -s /etc/sv/polkitd /var/service/
