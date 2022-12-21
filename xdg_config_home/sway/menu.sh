#!/bin/sh

fuzzel \
    --font="DeJaVu Sans Mono: size=9" \
    --no-icons \
    --background-color="${1}f0" \
    --text-color="${2}ff" \
    --selection-color="${3}ff" \
    --selection-text-color="${4}ff" \
    --border-color="${5}ff" \
    --border-width=$6 \
    --border-radius=0 \
    --horizontal-pad=10 \
    --vertical-pad=10 \
    --inner-pad=10 \
    --terminal="${7} -e" \
    --width=50 \
    --lines=$8
