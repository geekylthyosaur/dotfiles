#!/bin/sh

doas apk add wayland wayland-devel wayland-protocols wlroots wlroots-devel make gcc pkg-config
d=$PWD
cd $HOME
git clone https://github.com/geekylthyosaur/dwl.git
cd dwl
make
cd $d

