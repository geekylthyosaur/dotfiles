#!/bin/bash

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

ping -c 1 1.1.1.1 > /dev/null 2>&1 || {
    echo "Error: No internet connection."
    exit 1
}

mkdir -p /etc/xbps.d
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://repo-default.voidlinux.org|https://repo-fastly.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf

xbps-install -Sy mesa-ati-dri \
    sway swaybg swaylock swayidle swaykbdd wl-clipboard Waybar fuzzel wlogout \
    seatd greetd \
    firefox telegram-desktop \
    qemu bridge-utils libvirt virt-manager \
    texstudio texlive texlive-langcyrillic \
    fish-shell alacritty neovim tmux htop neofetch opendoas git\
    podman podman-compose \
    tlp light iwd iwgtk openresolv bluez blueman \
    pipewire wireplumber alsa-pipewire libspa-bluetooth pulseaudio-utils playerctl \
    slurp grim ffmpeg \
    net-tools xtools smartmontools zip unzip \
    xdg-user-dirs xdg-desktop-portal-wlr \
    gsettings-desktop-schemas \
    dejavu-fonts-ttf breeze-obsidian-cursor-theme

read -p "Enter user name: " USERNAME
read -p "Enter user login: " USERLOGIN
# TODO: dash not support read -s
read -s -p "Enter user password: " USERPASSWORD
echo

useradd -m -G "wheel,floppy,audio,input,video,cdrom,optical,kvm,xbuilder,libvirt,_seatd" -c "$USERNAME" "$USERLOGIN"

echo "$USERLOGIN:$USERPASSWORD" | chpasswd -c SHA512

echo "light -I" >> /etc/rc.local
echo "light -O" >> /etc/rc.shutdown
echo "permit nopass :wheel" > /etc/doas.conf
echo "blacklist pcspkr" > /etc/modprobe.d/blacklist.conf

ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/seatd /var/service/
ln -s /etc/sv/iwd /var/service/
ln -s /etc/sv/bluetoothd /var/service/

ln -s /etc/sv/virtlockd /var/service
ln -s /etc/sv/virtlogd /var/service
ln -s /etc/sv/libvirtd /var/service

ln -s /etc/sv/tlp /var/service

ln -s /etc/sv/greetd /var/service/

# TODO:
# * TRIM,
# * ignore packages
