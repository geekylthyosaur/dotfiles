#!/bin/sh

case "$(printf "Suspend\nReload\nLogout\nReboot\nShutdown" | 
    fuzzel \
        --font="Noto Sans Mono: size=9" \
        --no-icons \
        --background-color=282828f0 \
        --text-color=ebdbb2ff \
        --selection-color=ebdbb2ff \
        --selection-text-color=282828ff \
        --border-color=458588ff \
        --border-radius=0 \
        --horizontal-pad=10 \
        --vertical-pad=10 \
        --inner-pad=10 \
        --width=50 \
        --lines=5 \
        --dmenu
    )" in
        Suspend) exec systemctl suspend;;
        Reload) exec swaymsg reload;;
        Logout) exec swaymsg exit;;
        Reboot) exec systemctl reboot;;
        Shutdown) exec systemctl halt;;
esac

