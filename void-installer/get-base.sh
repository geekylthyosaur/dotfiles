#!/bin/sh

doas xbps-install -y foot fuzzel neovim tmux htop \
    grim playerctl light \
    dbus polkit mesa-ati-dri \
    pipewire alsa-pipewire libpipewire0.2 \
    xdg-desktop-portal xdg-desktop-portal-wlr v4l2loopback gstreamer1-pipewire slurp \
    gsetting-desktop-schemas \
    noto-fonts-ttf noto-fonts-ttf-extra

doas ln -s /etc/sv/dbus /var/service/
doas ln -s /etc/sv/polkitd /var/service/
