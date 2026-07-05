#!/bin/bash
SELECTION=$(hyprctl -j clients | jq -r '
    .[] | "[\(.workspace.name)] \(.class) — \(.title)\t\(.address)"
' | fuzzel --dmenu --tab-delimiter $'\t' --display-columns 1 --prompt "Ventana: ")

[ -z "$SELECTION" ] && exit 0

ADDR=$(printf '%s' "$SELECTION" | awk -F'\t' '{print $2}')
WS=$(hyprctl -j clients | jq -r --arg a "$ADDR" '.[] | select(.address==$a) | .workspace.id')

hyprctl dispatch "hl.dsp.focus({workspace = $WS})"
hyprctl dispatch "hl.dsp.focus({window = \"address:$ADDR\"})"
