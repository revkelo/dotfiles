#!/usr/bin/env bash
# Cicla modos de pantalla al estilo Win+P: extender → duplicar → externo → laptop

INTERNAL="eDP-1"
STATE_FILE="/tmp/hypr-display-mode"
NOTIFY_ID=9911

# Detectar monitor externo conectado
EXTERNAL=$(hyprctl monitors all -j | jq -r --arg int "$INTERNAL" '.[] | select(.name != $int) | .name' | head -1)

if [ -z "$EXTERNAL" ]; then
    notify-send -r $NOTIFY_ID -t 3000 "Pantalla" "Sin monitor externo conectado"
    exit 0
fi

CURRENT=$(cat "$STATE_FILE" 2>/dev/null || echo "laptop")

case "$CURRENT" in
    "laptop")   NEXT="extender" ;;
    "extender") NEXT="duplicar" ;;
    "duplicar") NEXT="externo"  ;;
    "externo")  NEXT="laptop"   ;;
    *)          NEXT="extender" ;;
esac

case "$NEXT" in
    "extender")
        hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
        hyprctl keyword monitor "$EXTERNAL,preferred,1366x0,1"
        notify-send -r $NOTIFY_ID -t 2000 "Pantalla: Extender" "Laptop + $EXTERNAL"
        ;;
    "duplicar")
        hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
        hyprctl keyword monitor "$EXTERNAL,preferred,0x0,1,mirror,$INTERNAL"
        notify-send -r $NOTIFY_ID -t 2000 "Pantalla: Duplicar" "$EXTERNAL espeja la laptop"
        ;;
    "externo")
        hyprctl keyword monitor "$INTERNAL,disable"
        hyprctl keyword monitor "$EXTERNAL,preferred,0x0,1"
        notify-send -r $NOTIFY_ID -t 2000 "Pantalla: Solo externo" "$EXTERNAL activo"
        ;;
    "laptop")
        hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"
        hyprctl keyword monitor "$EXTERNAL,disable"
        notify-send -r $NOTIFY_ID -t 2000 "Pantalla: Solo laptop" "Solo pantalla interna"
        ;;
esac

echo "$NEXT" > "$STATE_FILE"
