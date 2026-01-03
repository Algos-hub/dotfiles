#!/usr/bin/env bash

current_window_location=$(hyprctl dispatch movewindow r)

if [[ "$current_window_location" = "ok" ]] then
    hyprctl dispatch movewindow r
else
    hyprctl dispatch movetoworkspace r+1
    hyprctl dispatch movewindow l
fi
