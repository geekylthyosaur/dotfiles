#!/bin/sh

echo $(find $HOME/media/pictures/wallpapers -type f | shuf -n 1)
