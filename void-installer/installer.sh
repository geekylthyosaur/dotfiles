#!/bin/sh

su root -c "xbps-install -Sy opendoas git && echo 'permit nopass :wheel' > /etc/doas.conf"

git clone https://github.com/geekylthyosaur/dotfiles.git
cd ./dotfiles/void-installer/

sh get-base.sh

while true; do
    read -p "Install seatd [1] or elogind [2]? " option
    case $option in
        1 ) sh get-seatd.sh; break;;
        2 ) sh get-elogind.sh; break;;
    esac
done

while true; do
    read -p "Install DWL? [y/n] " option
    case $option in
        y ) sh get-dwl.sh; break;;
        n ) break;;
    esac
done

while true; do
    read -p "Install Sway? [y/n] " option
    case $option in
        y ) sh get-sway.sh; break;;
        n ) break;;
    esac
done

while true; do
    read -p "Set some environment variables? [y/n] " option
    case $option in
        y ) sh set-env.sh; break;;
        n ) break;;
    esac
done

while true; do
    read -p "Remove some unnecesary packages? [y/n] " option
    case $option in
        y ) sh remove-unnecessary.sh; break;;
        n ) break;;
    esac
done
