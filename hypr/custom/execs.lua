
hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("uwsm app -- nwg-drawer -r -fm nautilus -g adw-gtk3 -i Adwaita -wm uwsm")
end)
