#!/usr/bin/env bash

SYSTEM_PROMPT="You are a helpful, quick assistant. Respond in at most 100 characters. \
If the content is not in English, translate it to English. \
If it is a word, give its meaning. If it is a name, give brief info. \
For math, simplify step by step. Say 'No info available' if unsure. \
Use as little text as possible. The content:"

content=$(wl-paste -p | tr '\n' ' ' | head -c 2000)

if [[ -z "$content" ]]; then
    notify-send "Claude" "No hay texto seleccionado" -a "Claude" -t 3000
    exit 0
fi

response=$(unset ANTHROPIC_BASE_URL; echo "$SYSTEM_PROMPT $content" | claude -p --model haiku --no-session-persistence 2>&1)

if [[ -z "$response" || "$response" == *"error"* || "$response" == *"Error"* || "$response" == *"failed"* ]]; then
    notify-send "Claude" "Error: $response" -a "Claude" -t 5000
    exit 1
fi

if [[ ${#content} -le 30 && "$content" != *$'\n'* ]]; then
    notify-send --app-name="Claude" --expire-time=10000 "$content" "$response"
else
    notify-send --app-name="Claude" --expire-time=10000 "Claude" "$response"
fi
