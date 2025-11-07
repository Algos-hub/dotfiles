#!/usr/bin/env bash

internetSearch=$(pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -dmenu -p "Search" -no-fixed-num-lines)
regex='^[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$'

if [[ -z "${internetSearch}" ]]; then
    echo ""
else
    echo "$internetSearch"
    if [[ "$internetSearch" =~ $regex ]]; then
        xdg-open https://www."$internetSearch" && hyprctl dispatch focuswindow initialclass:firefox | grep ok
    else
        xdg-open https://www.google.com/search\?client\=firefox-b-d\&q\="$internetSearch" && hyprctl dispatch focuswindow initialclass:firefox | grep ok
    fi
fi
