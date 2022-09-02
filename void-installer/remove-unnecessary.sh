echo "ignorepkg=sudo" | doas tee /etc/xbps.d/10-ignore.conf
echo "ignorepkg=linux-firmware-broadcom" | doas tee -a /etc/xbps.d/10-ignore.conf
echo "ignorepkg=linux-firmware-nvidia" | doas tee -a /etc/xbps.d/10-ignore.conf
doas xbps-remove -Rf sudo linux-firmware-broadcom linux-firmware-nvidia

