doas echo "ignorepkg=sudo" > /etc/xbps.d/10-ignore.conf
doas echo "ignorepkg=linux-firmware-broadcom" >> /etc/xbps.d/10-ignore.conf
doas echo "ignorepkg=linux-firmware-nvidia" >> /etc/xbps.d/10-ignore.conf
doas xbps-remove -Rf sudo linux-firmware-broadcom linux-firmware-nvidia

doas echo "export PATH=..." > /etc/profile.d/path.sh
doas echo "export XDG_CACHE_HOME=$HOME/.cache" > /etc/profile.d/env.sh
doas echo "export XDG_CONFIG_HOME=$HOME/.config" >> /etc/profile.d/env.sh
doas echo "export XDG_DATA_HOME=$HOME/.local/share" >> /etc/profile.d/env.sh
doas echo "export XDG_STATE_HOME=$HOME/.local/state" >> /etc/profile.d/env.sh

doas echo "export CARGO_HOME=$XDG_DATA_HOME/cargo" >> /etc/profile.d/env.sh
doas echo "export RUSTUP_HOME=$XDG_DATA_HOME/rustup" >> /etc/profile.d/env.sh

doas echo "export PATH=$HOME/.local/share/cargo/bin:$PATH" >> /etc/profile.d/env.sh
doas echo "export PATH=$HOME/.local/bin:$PATH" >> /etc/profile.d/env.sh
