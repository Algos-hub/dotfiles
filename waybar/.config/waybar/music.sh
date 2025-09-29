#!/usr/bin/env bash

player_from_url=$(playerctl metadata xesam:url | sed 's/https:\/\///;s/.com\/.*//')
player_from_player_name=$(playerctl metadata --format '{{playerName}}')

active_window=$hyprctl activewindow |awk '/pid:/ {print $2}'

case $player_from_player_name in

    'firefox' | 'tidal-hifi')
        hyprctl dispatch togglespecialworkspace $player_from_url
    ;;

  *)
      if [ $active_window != $player_from_player_name ]; then
          hyprctl dispatch focuswindow pid:$(pgrep -o $player_from_player_name)
      else
          hyprctl dispatch focuscurrentorlast
      fi
    ;;
esac
