#!/bin/sh

i=$(printf "Suspend\nLog Out\nReload\nReboot\nShutdown" | 
    fuzzel --font="Noto Sans Mono: size=9" \
    --no-icons \
    --background-color=282828f0 \
    --text-color=ebdbb2ff \
    --selection-color=ebdbb2ff \
    --selection-text-color=282828ff \
    --border-color=458588ff \
    --border-radius=0 \
    --horizontal-pad=10 \
    --vertical-pad=10 \
    --inner-pad=10 \
    --lines=5 \
    --dmenu \
    --index
    ) 
if [ "$i" -eq "0" ];
then 
    exec doas zzz
elif [ "$i" -eq "1" ];
then 
    exec swaymsg exit
elif [ "$i" -eq "2" ];
then 
    exec swaymsg reload
elif [ "$i" -eq "3" ];
then 
    exec doas reboot
elif [ "$i" -eq "4" ];
then 
    exec doas shutdown -h now
fi
