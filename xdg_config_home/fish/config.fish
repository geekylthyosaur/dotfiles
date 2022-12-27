set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup

set -x QT_QPA_PLATFORMTHEME gtk3

set -x INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -x HISTFILE $XDG_DATA_HOME/shell_history

if status is-interactive
    set fish_greeting

    fish_add_path ~/.local/bin ~/.local/share/cargo/bin ~/.local/share/rustup/toolchains/*/bin /sbin /usr/sbin
end
