---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move focus with mainMod + arrow keys
-- Move focused windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Shell keybinds
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("dms ip call lock lock"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("dms ip call processlist toggle"))

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("brave --app=https://irc.ax-servers.hu"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("youtube-music-desktop"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("slack"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("/opt/teams-for-linux/teams-for-linux --ozone-platform=x11 %U"))
hl.bind(mainMod .. " + ALT + CTRL + L", hl.dsp.exec_cmd("systemctl --user start lan-mouse"))
hl.bind(mainMod .. " + ALT + CTRL + K", hl.dsp.exec_cmd("systemctl --user stop lan-mouse"))

-- Reboot and Restart
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("systemctl reboot"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("systemctl poweroff"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
