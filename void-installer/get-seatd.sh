#!/bin/sh

doas xbps-install -y seatd
doas usermod -aG $USER _seatd
