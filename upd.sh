#!/bin/sh

cp -r $XDG_CONFIG_HOME/alacritty ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/fish ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/nvim/init.vim ./xdg_config_home/nvim/
cp -r $XDG_CONFIG_HOME/sway ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/tmux ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/user-dirs.dirs ./xdg_config_home
cp -r $XDG_CONFIG_HOME/waybar ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/htop ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/i3 ./xdg_config_home/
cp $XDG_CONFIG_HOME/user-dirs.dirs ./xdg_config_home/
cp $XDG_CONFIG_HOME/mimeapps.list ./xdg_config_home/

cp -r $XDG_DATA_HOME/style.css ./xdg_data_home/

cp -r /etc/greetd .

cp -r $HOME/.mozilla/firefox/*/chrome/ ./firefox/
cp -r $HOME/documents/scripts ./
