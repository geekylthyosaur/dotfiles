#!/bin/sh

echo $(find $HOME/pix/wallpapers -type f | shuf -n 1)
