#!/bin/sh

text=$($1)
if [ ! -z $text ]; then 
	firefox --new-tab "${2}$text"
	swaymsg '[app_id=Firefox]' focus
else 
	exit
fi 
