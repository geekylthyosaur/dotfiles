#!/bin/sh

doas xbps-install -y sway swayimg swaybg swaylock swaylockd swayidle wl-clipboard waybar eudev
doas setup-devd udev
doas adduser $USER input
doas adduser $USER video
