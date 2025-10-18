#!/usr/bin/env bash

internetSearch=$(rofi -dmenu -p "Search" -no-fixed-num-lines)

if [[ -z "${internetSearch}" ]]; then
    echo ""
else
    xdg-open https://www.google.com/search\?client\=firefox-b-d\&q\="$internetSearch" && hyprctl dispatch focuswindow initialclass:firefox | grep ok
fi
