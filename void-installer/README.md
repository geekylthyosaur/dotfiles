1. Install [Void Linux](https://voidlinux.org/download/)
2. Execute [`get-this.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-this.sh) manually
3. Execute [`get-base.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-base.sh)
4. Execute [`get-elogind.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-elogind.sh) **OR** [`get-seatd.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-seatd.sh)
  
    >`elogind` manages user logins and system power, as a standalone version of `systemd-logind`. `elogind` provides necessary features for most desktop environments and Wayland compositors. It can also be one of the mechanisms for rootless `Xorg`.

    >`seatd` is a minimal seat management daemon and an alternative to `elogind` primarily for wlroots compositors.
    >Note that, unlike `elogind`, `seatd` doesn't do anything besides managing seats.

5. Execute [`get-sway.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-sway.sh) and/or [`get-dwl.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/get-dwl.sh)
6. Put `\*-\*-launch.sh` into `~/.local/bin/` and `chmod +x` it
7. Optionally execute [`set-env.sh`](https://github.com/geekylthyosaur/dotfiles/blob/main/void-installer/set-env.sh)
