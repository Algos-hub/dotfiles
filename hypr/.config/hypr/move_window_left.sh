#!/usr/bin/env bash

current_window_location=$(hyprctl dispatch movewindow l)
edge_case_test=$(hyprctl dispatch movetoworkspace r-1)

if [[ "$current_window_location" = "ok" ]]
then
    hyprctl dispatch movewindow l
elif [[ "$edge_case_test" = "ok" ]]
then
    hyprctl dispatch movetoworkspace r-1
    hyprctl dispatch movewindow r
else
    hyprctl dispatch movetoworkspace r-1
fi

