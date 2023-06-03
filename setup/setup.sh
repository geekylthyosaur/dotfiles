#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root."
    exit 1
fi

if [ -z "$USERNAME" ]; then
    echo "Error: USERNAME is not set."
    exit 1
fi

if [ -z "$USERLOGIN" ]; then
    echo "Error: USERLOGIN is not set."
    exit 1
fi

if [ -z "$USERPASSWORD" ]; then
    echo "Error: USERPASSWORD is not set."
    exit 1
fi

mkdir -p /etc/xbps.d
cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/
sed -i 's|https://repo-default.voidlinux.org|https://repo-fastly.voidlinux.org|g' /etc/xbps.d/*-repository-*.conf

xbps-install -Sy mesa-ati-dri \
    sway swaybg swaylock swayidle swaykbdd wl-clipboard Waybar fuzzel \
    seatd greetd \
    firefox telegram-desktop \
    qemu bridge-utils libvirt virt-manager \
    fish-shell alacritty tmux htop neofetch opendoas \
    tlp light iwd iwgtk openresolv bluez blueman \
    pipewire wireplumber alsa-pipewire libspa-bluetooth pulseaudio-utils playerctl \
    slurp grim \
    net-tools xtools smartmontools \
    xdg-user-dirs xdg-desktop-portal-wlr \
    gsettings-desktop-schemas \
    dejavu-fonts-ttf

ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/seatd /var/service/
ln -s /etc/sv/greetd /var/service/
ln -s /etc/sv/iwd /var/service/
ln -s /etc/sv/bluetoothd /var/service/

ln -s /etc/sv/virtlockd /var/service
ln -s /etc/sv/virtlogd /var/service
ln -s /etc/sv/libvirtd /var/service

ln -s /etc/sv/tlp /var/service

useradd -m -G "wheel,floppy,audio,input,video,cdrom,optical,kvm,xbuilder,libvirt,_seatd" -c "$USERNAME" "$USERLOGIN"

echo "$USERLOGIN:$USERPASSWORD" | chpasswd -c SHA512

echo "light -O" >> /etc/rc.local
echo "light -I" >> /etc/rc.shutdown
echo "permit nopass :wheel" > /etc/doas.conf
echo "blacklist pcspkr" > /etc/modprobe.d/blacklist.conf

# TODO:
# * TRIM,
# * ignore packages
