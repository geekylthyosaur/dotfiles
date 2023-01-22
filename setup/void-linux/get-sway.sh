#!/bin/sh

doas xbps-install -y sway swayimg swaybg swaylock swaylockd swayidle wl-clipboard waybar

doas usermod -aG input $USER
doas usermod -aG video $USER
