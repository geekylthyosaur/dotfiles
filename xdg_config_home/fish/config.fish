### Rust
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

set -x QT_QPA_PLATFORMTHEME gtk3

### XDG base
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc

# History
set -x SQLITE_HISTORY $XDG_STATE_HOME/sqlite_history
set -x HISTFILE $XDG_DATA_HOME/shell_history
set -x PSQL_HISTORY $XDG_STATE_HOME/psql_history
# Docker
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
# TeX live
set -x TEXMFHOME $XDG_DATA_HOME/texmf
set -x TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
set -x TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config

if status is-interactive
    set fish_greeting

    fish_add_path ~/.local/bin ~/.local/share/cargo/bin ~/.local/share/rustup/toolchains/*/bin /sbin /usr/sbin /usr/lib/psql*/bin/
    
    alias install="doas xbps-install"
    alias update="doas xbps-install -S"
    alias upgrade="doas xbps-install -Su"
    alias remove="doas xbps-remove -Rf"
    alias search="doas xbps-query -Rs"
    
    alias c="cargo"
    alias cr="cargo run"
    alias crr="cargo run --release"
    alias cb="cargo build"
    alias cbr="cargo build --release"
    alias cc="cargo check"
    alias cl="cargo clippy"
    alias ct="cargo test"
    alias cf="cargo fmt"

    alias todo="grep -rni todo src"
end
