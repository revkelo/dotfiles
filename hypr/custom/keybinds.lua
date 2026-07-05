hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

-- Explorador de archivos
hl.bind("SUPER+R", hl.dsp.exec_cmd("nautilus"), { description = "Abrir explorador de archivos" })

-- Mostrar escritorio (minimizar/restaurar todas las ventanas del workspace)
hl.bind("SUPER + H", hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/show-desktop.sh"),
    { description = "Window: Show desktop" })


-- Cajón de aplicaciones (estilo Ubuntu/GNOME)
hl.bind("SUPER + ALT + A", hl.dsp.exec_cmd("nwg-drawer -fm nautilus -g adw-gtk3 -i Adwaita"),
    { description = "App: Cajón de aplicaciones" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd("nwg-drawer -fm nautilus -g adw-gtk3 -i Adwaita -wm hyprland"),
    { description = "App: Cajón de aplicaciones" })

-- Claude: consulta rápida del texto seleccionado
hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/ai/claude-selection-query.sh"),
    { description = "Claude: Resumir texto seleccionado" })

-- Claude: chatbot flotante
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/ai/claude-chat.sh"),
    { description = "Claude: Chat flotante" })

-- Claude: chatbot flotante sin restricciones de permisos
hl.bind("SUPER + SHIFT + ALT + C", hl.dsp.exec_cmd("kitty -e claude --dangerously-skip-permissions"),
    { description = "Claude: Chat sin restricciones" })

-- Modos de pantalla (estilo Win+P): extender → duplicar → externo → laptop
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd("~/.config/hypr/custom/scripts/display-mode.sh"),
    { description = "Display: Ciclar modo de pantalla" })
