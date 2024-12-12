set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

# Prepending path in case a system-installed rustc needs to be overridden
fish_add_path --prepend /home/dmytro/.local/share/cargo/bin

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

