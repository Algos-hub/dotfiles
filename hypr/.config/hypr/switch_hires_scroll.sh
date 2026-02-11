#!/bin/bash

COMMAND=$(grep "hires: true" /etc/logid.cfg)
$COMMAND
STATUS=$?

if (( $STATUS )); then
    hyprctl keyword input:scroll_factor 0.05
else
    hyprctl keyword input:scroll_factor 1.0
fi
