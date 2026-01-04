#!/usr/bin/env bash

current_window_location=$(hyprctl dispatch movewindow l)

if [[ "$current_window_location" = "ok" ]]
then
    echo ""
else
    hyprctl dispatch movetoworkspace r-1
    hyprctl dispatch movewindow r
fi

