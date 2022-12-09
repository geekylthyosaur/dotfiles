#!/bin/sh

doas apk add elogind polkit-elogind

doas rc-update add elogind 
doas rc-service elogind start
