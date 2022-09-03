#!/bin/sh

su
xbps-install -Sy opendoas git
echo "permit nopass :wheel" > /etc/doas.conf
exit
git clone https://github.com/geekylthyosaur/dotfiles.git
