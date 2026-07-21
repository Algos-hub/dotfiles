#!/usr/bin/env bash

current_player=$(playerctl metadata)

if [[ "$current_player" ]] then
    case $(playerctl metadata | awk 'NR==1{print $1}') in
        'tidal-hifi')
            pgrep tidal-hifi > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special("tidal")' || tidal-hifi
            ;;

        'chromium')
            hyprctl clients | grep YouTube Music > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special("music.youtube")' || youtube-music-desktop-app
            ;;

        'rhythmbox')
            pgrep rhythmbox > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.focus({ window = \"class:^(org.gnome.Rhythmbox3)$\"})' | grep ok || rhythmbox
            ;;

        *)
            pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi drun -show drun -p "Music" -theme-str 'inputbar {enabled: false;} listview {border: 0; padding: 0;}' -filter 'Music ' -no-fixed-num-lines
            ;;
    esac
else
    pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi drun -show drun -p "Music" -theme-str 'inputbar {enabled: false;} listview {border: 0; padding: 0;}' -filter 'Music ' -no-fixed-num-lines
fi
