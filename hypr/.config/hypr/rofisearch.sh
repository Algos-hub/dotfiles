#!/usr/bin/env bash

internetSearch=$(pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -dmenu -p "Search" -no-fixed-num-lines)
regex='^[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$'

if [[ -z "${internetSearch}" ]]; then
    echo ""
else
    echo "$internetSearch"
    if [[ "$internetSearch" =~ $regex ]]; then
        xdg-open https://www."$internetSearch" && hyprctl dispatch 'hl.dsp.focus({ window = "class:^(librewolf)$" })' | grep ok
    else
        xdg-open https://duckduckgo.com/?q="$internetSearch" && hyprctl dispatch 'hl.dsp.focus({ window = "class:^(librewolf)$" })' | grep ok
    fi
fi
