#!/usr/bin/env bash
MODEL="${CLAUDE_MODEL:-claude-sonnet-4-6}"
PROXY="http://localhost:4099/v1/chat/completions"
HISTORY='[]'

C_RESET='\033[0m'
C_CYAN='\033[1;36m'
C_GREEN='\033[1;32m'
C_BLUE='\033[1;34m'
C_GRAY='\033[0;90m'

echo -e "${C_CYAN}╭─ Claude Chat ─ ${MODEL}${C_RESET}"
echo -e "${C_GRAY}│ Ctrl+C para salir | línea vacía para nueva línea${C_RESET}"
echo -e "${C_CYAN}╰────────────────────────────────────${C_RESET}"
echo ""

while true; do
    printf "${C_GREEN}Tú:${C_RESET} "
    read -r input || break
    [[ -z "$input" ]] && continue

    HISTORY=$(jq -n --argjson h "$HISTORY" --arg m "$input" \
        '$h + [{"role":"user","content":$m}]')

    printf "${C_BLUE}Claude:${C_RESET} "

    FULL_RESPONSE=""
    while IFS= read -r line; do
        [[ "$line" == "data: [DONE]" ]] && break
        [[ "$line" != data:* ]] && continue
        json="${line#data: }"
        text=$(printf '%s' "$json" | jq -r '.choices[0].delta.content // empty' 2>/dev/null)
        if [[ -n "$text" ]]; then
            printf "%s" "$text"
            FULL_RESPONSE+="$text"
        fi
    done < <(curl -s -N "$PROXY" \
        -H "Content-Type: application/json" \
        -d "$(jq -n --arg m "$MODEL" --argjson h "$HISTORY" \
            '{"model":$m,"messages":$h,"stream":true}')")

    echo -e "\n"
    HISTORY=$(jq -n --argjson h "$HISTORY" --arg m "$FULL_RESPONSE" \
        '$h + [{"role":"assistant","content":$m}]')
done
