### XDG base
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

# Rust
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

# Ansible
set -x ANSIBLE_HOME "$XDG_CONFIG_HOME/ansible"
set -x ANSIBLE_CONFIG "$XDG_CONFIG_HOME/ansible.cfg"
set -x ANSIBLE_GALAXY_CACHE_DIR "$XDG_CACHE_HOME/ansible/galaxy_cache"

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

    if command -v "git" &> /dev/null
        alias gs="git status"
        alias gl="git log"
        alias gd="git diff"
        alias gds="git diff --staged"
        alias gaa="git add -A"

        abbr -a ga 'git add'
        abbr -a gcm --set-cursor=! 'git commit -m "!"'
        abbr -a gca --set-cursor=! 'git add -A; git commit -m "!"'
        abbr -a gco 'git checkout'
        abbr -a gu 'git reset --soft HEAD^'
    end

    alias tree="tree --dirsfirst"
end

function fish_greeting; end
function fish_right_prompt; end
