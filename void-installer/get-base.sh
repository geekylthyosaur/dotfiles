#!/bin/sh

doas xbps-install -y foot fuzzel neovim tmux
doas xbps-install -y dbus polkit mesa-ati-dri
doas xbps-install -y pipewire alsa-pipewire
doas xbps-install -y xdg-desktop-portal xdg-dekstop-portal-wlr v4l2loopback gstreamer1-pipewire
doas xbps-install -y noto-fonts-ttf noto-fonts-ttf-extra

doas ln -s /etc/sv/dbus /var/service/
