#!/bin/sh

doas xbps-install -y sway swayimg swaybg swaylock swaylockd swayidle swaykbdd wl-clipboard Waybar

doas usermod -aG input $USER
doas usermod -aG video $USER
