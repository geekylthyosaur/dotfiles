#!/bin/sh

cat $XDG_DATA_HOME/style.css | awk '{ print "set $" $2 " " $3 }' | sed 's/.$//' > colors
