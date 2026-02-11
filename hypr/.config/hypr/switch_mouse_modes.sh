#!/bin/bash

CFG="/etc/logid.cfg"

if grep -q "hires: true" "$CFG"; then
    sed -i 's/hires: true/hires: false/' "$CFG"
    sed -i 's/on: false/on: true/' "$CFG"
    runuser -l pedro -c "hyprctl keyword input:scroll_factor 1"
else
    sed -i 's/hires: false/hires: true/' "$CFG"
    sed -i 's/on: true/on: false/' "$CFG"
    runuser -l pedro -c "hyprctl keyword input:scroll_factor 0.05"
fi

systemctl restart logid
