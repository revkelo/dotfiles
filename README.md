# dotfiles — revkelo

> CachyOS · Hyprland · Quickshell · Fish · IA integrada

![Desktop](screenshots/desktop.png)

---

## Sistema

| | |
|---|---|
| **OS** | CachyOS (rolling, base Arch) |
| **Kernel** | 7.0.5-2-cachyos (PREEMPT_DYNAMIC) |
| **Compositor** | Hyprland v0.55.1 |
| **Shell** | Fish 4.7.1 + Starship |
| **Hardware** | Dell Inspiron 15 3515 — Ryzen 5 3450U · Radeon Vega · 13 GB RAM |

---

## Screenshots

| Desktop | Panel de notificaciones |
|---|---|
| ![Desktop](screenshots/desktop.png) | ![Notifications](screenshots/notifications.png) |

---

## Stack

| Rol | App |
|---|---|
| Barra / Widgets | Quickshell (`ii` profile) |
| Terminal | Kitty + JetBrains Mono Nerd Font |
| Lanzador | Fuzzel |
| Navegador | Chrome |
| Editor | VS Code |
| Explorador | Nautilus |
| Monitor | btop |
| Audio | PipeWire + EasyEffects |
| Tema GTK | adw-gtk3 dark |
| Cursor | Bibata-Modern-Classic 24px |
| Colores | Generados dinámicamente con `matugen` al cambiar wallpaper |

---

## IA integrada

- **Claude Code** — `Super + Alt + C` abre Kitty con Claude Code listo para usar
- **Sidebar IA** — `Super + A` con soporte para Claude, Gemini, Mistral y DeepSeek
- **LiteLLM proxy** local en `localhost:4099` (API compatible con OpenAI)
- **Consulta rápida** — selecciona texto + `Super + Shift + Alt + clic-der` → respuesta como notificación

---

## Atajos clave

| Atajo | Acción |
|---|---|
| `Super + Return` | Terminal (Kitty) |
| `Super + W` | Chrome |
| `Super + C` | VS Code |
| `Super + R` | Nautilus |
| `Super + Tab` | Overview de workspaces |
| `Super + V` | Historial portapapeles |
| `Super + Shift + S` | Captura de región |
| `Super + L` | Bloquear pantalla |
| `Super + Alt + C` | Claude Code |
| `Super + A` | Sidebar IA |
| `Ctrl + Shift + Escape` | btop |

---

## Estructura

```
~/.config/
├── hypr/
│   ├── hyprland.conf
│   ├── custom/             # cambios personales aquí
│   │   ├── keybinds.lua
│   │   ├── variables.lua
│   │   ├── execs.lua
│   │   └── scripts/ai/
│   └── hypridle.conf
├── fish/
├── quickshell/
├── kitty/
├── fuzzel/
├── btop/
└── hypr/hyprlock/
```

---

## Instalar en sistema nuevo

```bash
git clone https://github.com/revkelo/dotfiles ~/.config

sudo pacman -S hyprland fish starship kitty fuzzel btop nwg-drawer quickshell matugen
```

> Los cambios personales de Hyprland van siempre en `~/.config/hypr/custom/`, nunca en `~/.config/hypr/hyprland/`.
