#!/bin/sh

echo $1
text=$($1)
echo $text
if [ ! -z "$text" ]; then 
	firefox --new-tab "${2}$text"
	swaymsg '[app_id=Firefox]' focus
else 
	exit
fi 
