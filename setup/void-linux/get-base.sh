#!/bin/sh

while true; do
    read -p "Install amd [1], intel [2] or nvidia [3] graphics? " option
    case $option in
        1 ) doas xbps-install -y mesa-ati-dri; break;;
        2 ) doas xbps-install -y mesa-intel-dri; break;;
        3 ) doas xbps-install -y mesa-nouveau-dri; break;;
    esac
done

doas xbps-install -y firefox chromium
doas xbps-install -y alacritty fuzzel neovim tmux htop
doas xbps-install -y light
doas xbps-install -y polkit dbus
doas xbps-install -y pipewire wireplumber alsa-pipewire playerctl pulseaudio-utils
doas xbps-install -y slurp grim
doas xbps-install -y net-tools xtools smartmontools
doas xbps-install -y xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-wlr
doas xbps-install -y gsettings-desktop-schemas
doas xbps-install -y ttf-dejavu

