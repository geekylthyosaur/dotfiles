#!/bin/sh

doas xbps-install -y seatd

doas ln -s /etc/sv/seatd/ /var/service/
doas usermod -aG _seatd $USER 
