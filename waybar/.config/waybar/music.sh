#!/usr/bin/env bash

player_from_url=$(playerctl metadata xesam:url | sed 's/https:\/\///;s/.com\/.*//')
player_from_player_name=$(playerctl metadata --format '{{playerName}}')

active_window=$hyprctl activewindow |awk '/pid:/ {print $2}'

case $player_from_player_name in

    'tidal-hifi')
        hyprctl dispatch 'hl.dsp.workspace.toggle_special("tidal")'
    ;;

    'chromium')
        hyprctl dispatch 'hl.dsp.workspace.toggle_special("music.youtube")'
    ;;

  *)
      if [ $active_window != $player_from_player_name ]; then
          hyprctl dispatch "hl.dsp.focus({ window = \"pid:$player_from_player_name\"})"
      else
          hyprctl dispatch 'hl.dsp.focus({ last = true })'
      fi
    ;;
esac
