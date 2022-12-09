1. Install [Void Linux](https://voidlinux.org/download/) using "Install from network" source and xfce[^1]+glibc[^2] image.
2. Execute [`get-installer.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-installer.sh) manually.
3. Execute [`installer.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/installer.sh).
4. Put `*-*-launch.sh` into `~/.local/bin/` and `chmod +x` it.
[^1]: If you wish to use gparted as cfdisk has issue where you cannot select partition table type.
[^2]: Or musl if you feel ok when screen sharing not working in chromium based browsers (even flatpak's).
