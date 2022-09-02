echo "export XDG_CACHE_HOME=$HOME/.cache" | doas tee /etc/profile.d/env.sh
echo "export XDG_CONFIG_HOME=$HOME/.config" | doas tee -a /etc/profile.d/env.sh
echo "export XDG_DATA_HOME=$HOME/.local/share" | doas tee -a /etc/profile.d/env.sh
echo "export XDG_STATE_HOME=$HOME/.local/state" | doas tee -a /etc/profile.d/env.sh

echo "export CARGO_HOME=$XDG_DATA_HOME/cargo" | doas tee -a /etc/profile.d/env.sh
echo "export RUSTUP_HOME=$XDG_DATA_HOME/rustup" | doas tee -a /etc/profile.d/env.sh

echo "export PATH=$HOME/.local/share/cargo/bin:$PATH" | doas tee -a /etc/profile.d/env.sh
echo "export PATH=$HOME/.local/bin:$PATH" | doas tee -a /etc/profile.d/env.sh
