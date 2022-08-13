#!/bin/sh

case "$(printf "Suspend\nLogout\nReboot\nShutdown" | 
    dmenu \
    -l 5 \
    -fn "Noto Sans Mono: size=10" \
    -nb "#282828" \
    -nf "#ebdbb2" \
    -sb "#ebdbb2" \
    -sf "#282828" \
    )" in
        Suspend) exec systemctl suspend;;
        Logout) i3-msg exit;;
        Reboot) exec systemctl reboot;;
        Shutdown) exec systemctl shutdown now;;
esac

