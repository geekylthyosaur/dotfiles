su
xbps-install opendoas
echo "permit nopass :wheel" > /etc/doas.conf
exit

doas xbps-install git foot tmux neovim fuzzel
doas xbps-install dbus polkit mesa-ati-dri

git clone https://github.com/geekylthyosaur/dotfiles.git
mkdir .config
cp -r dotfiles/xdg_config_home/tmux .config/

doas xbps-install elogind
=== OR ===
doas xbps-install seatd
doas usermod -aG $USER _seatd

doas xbps-install wayland wayland-devel wayland-protocols wlroots wlroots-devel make gcc pkg-config
git clone  https://github.com/geekylthyosaur/dwl.git
cd dwl
make
=== OR ===
doas xbps-install sway

doas xbps-install pipewire alsa-pipewire
doas xbps-install xbps-desktop-portal xdg-desktop-portal-wlr v4l2loopback gstreamer1-pipewire
doas xbps-install noto-fonts-ttf noto-fonts-extra
doas ln -s /etc/sv/dbus /var/service/

doas echo "ignorepkg=sudo" > /etc/xbps.d/10-ignore.conf
doas echo "ignorepkg=linux-firmware-broadcom" >> /etc/xbps.d/10-ignore.conf
doas echo "ignorepkg=linux-firmware-nvidia" >> /etc/xbps.d/10-ignore.conf
doas xbps-remove -Rf sudo linux-firmware-broadcom linux-firmware-nvidia

echo "export PATH=..." > /etc/profile.d/path.sh
echo "export XDG_CACHE_HOME=$HOME/.cache" > /etc/profile.d/env.sh
echo "export XDG_CONFIG_HOME="$HOME/.config" >> /etc/profile.d/env.sh
echo "export XDG_DATA_HOME=$HOME/.local/share" >> /etc/profile.d/env.sh
echo "export XDG_STATE_HOME=$HOME/.local/state" >> /etc/profile.d/env.sh

echo "export CARGO_HOME=$XDG_DATA_HOME/cargo" >> /etc/profile.d/env.sh
echo "export RUSTUP_HOME=$XDG_DATA_HOME"/rustup" >> /etc/profile.d/env.sh

echo "export PATH=$HOME/.local/share/cargo/bin:$PATH" >> /etc/profile.d/env.sh
echo "export PATH=$HOME/.local/bin:$PATH" >> /etc/profile.d/env.sh

=== Run Sway ===
~./local/bin/sway_launchs.sh
#!/bin/sh

export XDG_RUNTIME_DIR=/tmp/user/$(id -u)
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

exec dbus-run-session sway

=== Run DWL ===
~./local/bin/dwl_launch.sh
#!/bin/sh

export XDG_RUNTIME_DIR=/tmp/user/$(id -u)
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

exec dbus-run-session dwl
