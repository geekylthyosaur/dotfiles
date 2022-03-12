#!/bin/sh
picom -b &
xset b off &
xset r rate 235 35 &
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Left Handed Enabled" 1 &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 0.4
