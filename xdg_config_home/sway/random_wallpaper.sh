#!/bin/sh

echo $(find $HOME/pictures/wallpapers -type f | shuf -n 1)
