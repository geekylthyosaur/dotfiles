#!/bin/sh

# TODO: check if variables are set

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_DATA_HOME
mkdir -p $XDG_CACHE_HOME

cp -r ./xdg_config_home/user-dirs.dirs $XDG_CONFIG_HOME
# TODO: create dirs
xdg-user-dirs-update

cp -r ./xdg_config_home/alacritty $XDG_CONFIG_HOME
cp -r ./xdg_config_home/htop $XDG_CONFIG_HOME
cp -r ./xdg_config_home/tmux $XDG_CONFIG_HOME
cp -r ./xdg_config_home/xdg-desktop-portal-wlr $XDG_CONFIG_HOME
cp -r ./xdg_config_home/waybar $XDG_CONFIG_HOME
cp -r ./xdg_config_home/sway $XDG_CONFIG_HOME

cp ./xdg_data_home/style.css $XDG_DATA_HOME/
