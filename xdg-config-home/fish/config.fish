### XDG base
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

# Rust
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

if status is-interactive
    set fish_greeting

    fish_add_path ~/go/bin
    fish_add_path ~/.local/bin
    fish_add_path /sbin
    fish_add_path /usr/sbin

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

    alias dnf=dnf5

    alias tree="tree --dirsfirst"
end

function fish_greeting; end
function fish_right_prompt; end
