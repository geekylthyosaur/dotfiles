#!/bin/sh

while true; do
    read -p "Have you enabled the community repo? [y/n] " option
    case $option in
        y ) break;;
        n ) echo "Edit /etc/apk/repositories"; exit;;
    esac
done

sh "$HOME/dotfiles/setup/alpine-linux/get-base.sh"
sh "$HOME/dotfiles/setup/alpine-linux/get-seatd.sh"
sh "$HOME/dotfiles/setup/alpine-linux/set-env.sh"
