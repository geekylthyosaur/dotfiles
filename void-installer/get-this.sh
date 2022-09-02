#!/bin/sh

su
xbps-install -S
xbps-install opendoas
echo "permit nopass :wheel" > /etc/doas.conf
exit
doas xbps-install git
git clone https://github.com/geekylthyosaur/dotfiles.git
