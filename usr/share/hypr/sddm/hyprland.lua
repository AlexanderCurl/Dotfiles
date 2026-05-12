----------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------

local CURSOR_THEME = "BreezeDark"
local CURSOR_SIZE  = 24

----------------------------------------------------------------
-- MONITORS
----------------------------------------------------------------

hl.monitor({
    name = "DP-2",
    mode = "2560x1440@165",
    position = "0x0",
    scale = "auto",
    vrr = 2
})

hl.monitor({
    name = "DP-1",
    disable = true
})

----------------------------------------------------------------
-- MISC
----------------------------------------------------------------

hl.misc({
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,
    initial_workspace_tracking = 1,
})

----------------------------------------------------------------
-- INPUT
----------------------------------------------------------------

hl.input({
    numlock_by_default = true,
    kb_layout = "gb,hu",
})

----------------------------------------------------------------
-- CURSOR
----------------------------------------------------------------

hl.cursor({
    no_warps = true,
    no_hardware_cursors = true,
})

----------------------------------------------------------------
-- ENVIRONMENT
----------------------------------------------------------------

hl.env({
    HYPRCURSOR_THEME = CURSOR_THEME,
    HYPRCURSOR_SIZE = tostring(CURSOR_SIZE),
})

----------------------------------------------------------------
-- SOURCES
----------------------------------------------------------------

hl.source("/etc/sddm.conf.d/virtualkbd.conf")

----------------------------------------------------------------
-- SDDM GREETER RULES
----------------------------------------------------------------

hl.window_rule({
    name = "sddm-greeter",

    match = {
        class = "^(sddm%-greeter)$"
    },

    workspace = "emptym",
    fullscreen = true,
    stay_focused = true,
    decorate = false,
    no_anim = true,
    border_size = 0,
    no_dim = true,
    no_shadow = true,
})

----------------------------------------------------------------
-- EXEC
----------------------------------------------------------------

hl.exec_once("hyprctl setcursor " .. CURSOR_THEME .. " " .. CURSOR_SIZE)

hl.exec_once("hyprctl dispatch workspace 1")

hl.exec_once("xrandr --output DP-2 --primary")

hl.exec_once("xrandr -s 2560x1440@165")

----------------------------------------------------------------
-- KEYBOARD LAYOUT SWITCHER
----------------------------------------------------------------

local kb_switch_cmd = [[
hyprctl switchxkblayout all next -q &&
hyprctl notify "1 9000 rgba(1,1,1,1) Keyboard: $(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"
]]

hl.bind({
    mod = "SUPER",
    key = "K",
    action = function()
        os.execute(kb_switch_cmd)
    end
})
