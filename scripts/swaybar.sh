#!/bin/sh 

datetime=$(date +'%A, %H:%M:%S, %B %e')
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
brightness=$(light -G | tr "." "\n" | head -n 1)
audio_vol=$(pactl list sinks | grep "Volume:" | head -n 1 | awk '{print $5+1}')
mic_vol=$(pactl list sources | grep "Volume:" | head -n 3 | tail -1 | awk '{print $5+1}')
printf "$datetime                       墳 $audio_vol%%  $mic_vol%%  $brightness%%  $battery_capacity%%"

