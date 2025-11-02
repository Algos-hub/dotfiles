#!/usr/bin/env bash

current_window=$(hyprctl activewindow | grep 'initialClass: kitty')

if [[ "$current_window" ]] then
    kitty
else
    pgrep kitty > /dev/null 2>&1 && hyprctl dispatch focuswindow initialclass:kitty | grep ok || kitty
fi
