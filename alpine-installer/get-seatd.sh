#!/bin/sh

doas apk add seatd

doas rc-update seatd
doas rc-service seatd start
doas adduser $USER seat
