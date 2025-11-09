#!/usr/bin/env bash

current_player=$(playerctl metadata)

if [[ "$current_player" ]] then
    case $(playerctl metadata | awk 'NR==1{print $1}') in
        'tidal-hifi')
            pgrep tidal-hifi > /dev/null 2>&1 && hyprctl dispatch togglespecialworkspace tidal || tidal-hifi
            ;;

        'firefox')
            hyprctl clients | grep YouTube\ Music > /dev/null 2>&1 && hyprctl dispatch togglespecialworkspace music.youtube || /usr/bin/firefoxpwa site launch 01K2HNY553PNX7QE4QRH84EZS9
            ;;

        'rhythmbox')
            pgrep rhythmbox > /dev/null 2>&1 &&  hyprctl dispatch focuswindow initialclass:org.gnome.Rhythmbox3 | grep ok || rhythmbox
            ;;

        *)
            pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi drun -show drun -p "Music" -theme-str 'inputbar {enabled: false;} listview {border: 0; padding: 0;}' -filter 'Music ' -no-fixed-num-lines
            ;;
    esac
else
    pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi drun -show drun -p "Music" -theme-str 'inputbar {enabled: false;} listview {border: 0; padding: 0;}' -filter 'Music ' -no-fixed-num-lines
fi
