#!/bin/sh

doas xbps-install -y seatd
doas usermod -aG _seatd $USER 
doas ln -s /etc/sv/seatd /var/service/
