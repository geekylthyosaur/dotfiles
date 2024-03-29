### XDG base
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

# Rust
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

# Node
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history

# Java
# set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java

set -x QT_QPA_PLATFORMTHEME gtk3

set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc

# History
set -x SQLITE_HISTORY $XDG_STATE_HOME/sqlite_history
set -x HISTFILE $XDG_DATA_HOME/shell_history
set -x PSQL_HISTORY $XDG_STATE_HOME/psql_history
# TeX live
set -x TEXMFHOME $XDG_DATA_HOME/texmf
set -x TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
set -x TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config

if status is-interactive
    set fish_greeting

    fish_add_path ~/.local/bin
    fish_add_path ~/.local/share/npm/bin
    fish_add_path /sbin
    fish_add_path /usr/sbin
    fish_add_path ~/.config/composer/vendor/bin/
    fish_add_path /home/dmytro/.local/share/solana/install/active_release/bin

    if command -v "dnf" &> /dev/null
        alias install="sudo dnf install"
        alias update="sudo dnf update"
        alias upgrade="sudo dnf update"
        alias remove="sudo dnf remove"
        alias search="sudo dnf search"
    else if command -v "xbps-install" &> /dev/null
        alias install="doas xbps-install"
        alias update="doas xbps-install -S"
        alias upgrade="doas xbps-install -Su"
        alias remove="doas xbps-remove -Rf"
        alias search="doas xbps-query -Rs"
    end

    if command -v "cargo" &> /dev/null
        alias c="cargo"
        alias cr="cargo run"
        alias crr="cargo run --release"
        alias cb="cargo build"
        alias cbr="cargo build --release"
        alias cc="cargo check"
        alias cl="cargo clippy"
        alias ct="cargo test"
        alias cf="cargo fmt"
    end

    alias tree="tree --dirsfirst"
end

function fish_greeting; end
function fish_right_prompt; end
