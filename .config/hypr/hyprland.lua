------------------
---- SOURCES -----
------------------

-- Keybinds
require("config/keybinds")

-- Window rules
require("config/windowrules")

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@165",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@144",
    position = "2560x0",
    scale    = "1",
})

---------------------
----  WORKSPACES ----
---------------------

hl.workspace_rule({ workspace = "1", monitor = "DP-2", persistent = "1"})
hl.workspace_rule({ workspace = "2", monitor = "DP-2", persistent = "1"})
hl.workspace_rule({ workspace = "3", monitor = "DP-2", persistent = "1"})
hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = "1"})
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = "1"})
hl.workspace_rule({ workspace = "6", monitor = "DP-1", persistent = "1"})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "dms ipc call spotlight toggle"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
   hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
   hl.exec_cmd("bash -c 'wl-paste --watch cliphist store &'")
   hl.exec_cmd("dms run")
   hl.exec_cmd("sleep 1 && /usr/lib/pam_kwallet_init")
   hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
   hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
   hl.exec_cmd("easyeffects --gapplication-service")
   hl.exec_cmd("polychromatic-tray-applet")
   hl.exec_cmd("hyprctl dispatch workspace 1")
   hl.exec_cmd("nextcloud --background")
   hl.exec_cmd("kdeconnect-indicator")
   hl.exec_cmd("xrandr --output DP-2 --primary")
   hl.exec_cmd("xrandr -s 2560x144@165")
 end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("TERMINAL", "kitty")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "BreezeDark")
hl.env("XCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 0,

        col = {
            active_border   = "rgba(707070ff)",
            inactive_border = "rgba(d0d0d0ff)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 30,
            render_power = 5,
            color        = "rgba(00000070)",
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "gb,hu",
        kb_options = "grp:alt_shift_toggle",
        numlock_by_default = "1",

        follow_mouse = 1,
        accel_profile = "flat",

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- hl.gesture({
--    fingers = 3,
--    direction = "horizontal",
--    action = "workspace"
-- })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
--    name        = "epic-mouse-v1",
--    sensitivity = -0.5,
-- })
