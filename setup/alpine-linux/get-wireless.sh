#!/bin/sh

doas apk add networkmanager networkmanager-wifi
doas rc-service networkmanager start # TODO
doas adduser $USER plugdev
