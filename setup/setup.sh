#!/bin/sh

sh alpine-linux/installer.sh

# TODO:  
echo "Please, reboot"
exit

# TODO: 
mkdir -p $HOME/.local/bin
cp $HOME/dotfiles/setup/alpine-linux/sway-seatd-launch.sh $HOME/.local/bin/sway-launch
chmod +x $HOME/.local/bin/sway-launch

sh configs.sh
