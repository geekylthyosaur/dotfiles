#! /bin/sh
cp -r $XDG_CONFIG_HOME/alacritty ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/fish ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/nvim ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/sway ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/tmux ./xdg_config_home/
cp -r $XDG_CONFIG_HOME/waybar ./xdg_config_home/

cp -r $XDG_DATA_HOME/style.css ./xdg_data_home/

cp -r /etc/greetd .
