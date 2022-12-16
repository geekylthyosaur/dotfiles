#!/bin/sh

doas apk add seatd seatd-launch

doas rc-update add seatd
doas rc-service seatd start
doas adduser $USER seat
