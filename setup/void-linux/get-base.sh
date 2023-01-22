#!/bin/sh

while true; do
    read -p "Install amd [1] or intel [2] graphics? " option
    case $option in
        1 ) doas xbps-install -y mesa-dri-gallium mesa-va-gallium; break;;
        2 ) doas xbps-install -y mesa-dri-gallium libva-intel-driver; break;;
    esac
done

doas xbps-install -y firefox chromium
doas xbps-install -y alacritty fuzzel neovim tmux htop
doas xbps-install -y light
doas xbps-install -y dbus
doas xbps-install -y pipewire wireplumber pipewire-pulse pipewire-alsa playerctl
doas xbps-install -y pulseaudio-utils
doas xbps-install -y slurp grim
doas xbps-install -y xdg-user-dirs xdg-desktop-portal xdg-desktop-portal-wlr
doas xbps-install -y gsettings-desktop-schemas
doas xbps-install -y ttf-dejavu

