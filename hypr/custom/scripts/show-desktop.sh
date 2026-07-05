#!/bin/bash
PREV_FILE="/tmp/hypr_show_desktop_prev"
CURRENT_WS=$(hyprctl -j activeworkspace | jq .id)
CLIENTS=$(hyprctl -j clients | jq --argjson ws "$CURRENT_WS" '[.[] | select(.workspace.id==$ws)] | length')

if [ "$CLIENTS" -gt 0 ]; then
    echo "$CURRENT_WS" > "$PREV_FILE"
    USED=$(hyprctl -j workspaces | jq '[.[].id]')
    for i in $(seq 1 100); do
        if ! echo "$USED" | jq -e ". | index($i)" > /dev/null 2>&1; then
            hyprctl dispatch "hl.dsp.focus({workspace = $i})"
            break
        fi
    done
elif [ -f "$PREV_FILE" ]; then
    PREV=$(cat "$PREV_FILE")
    rm "$PREV_FILE"
    hyprctl dispatch "hl.dsp.focus({workspace = $PREV})"
fi
