#!/bin/sh

path="/sys/class/backlight/amdgpu_bl0/brightness"

for v in $($HOME/scripts/smoother $1 -p 10 -c $(cat $path))
do 
    echo $v > $path;
    sleep 0.03; 
done
