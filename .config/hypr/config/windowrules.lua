--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

----------------------------------------------------------------
-- FLOAT
----------------------------------------------------------------

local float_classes = {
    "^(confirmreset)$",
    "^(feh)$",
    "^(file%-roller)$",
    "^(Lxappearance)$",
    "^(splash)$",
    "^(xfce4%-appearance%-settings)$",
    "^(org%.kde%.polkit%-kde%-authentication%-agent%-1)$",
    "^(pavucontrol)$",
    "^(Picture%-in%-Picture)$",
    "^(Viewnior)$",
    "^(file_progress)$",
    "^(confirm)$",
    "^(dialog)$",
    "^(download)$",
    "^(notification)$",
    "^(error)$",
}

for _, class in ipairs(float_classes) do
    hl.window_rule({
        name = "float-class-" .. class,
        match = {
            class = class
        },
        float = true
    })
end

local float_titles = {
    "^(btop)$",
    "^(Network Connections)$",
    "^(Media viewer)$",
    "^(Volume Control)$",
    "^(DevTools)$",
    "^(Open File)$",
    "^(branchdialog)$",
    "^(Confirm to replace files)$",
    "^(File Operation Progress)$",
}

for _, title in ipairs(float_titles) do
    hl.window_rule({
        name = "float-title-" .. title,
        match = {
            title = title
        },
        float = true
    })
end

----------------------------------------------------------------
-- FULLSCREEN
----------------------------------------------------------------

hl.window_rule({
    name = "fullscreen-wlogout",
    match = {
        class = "^(wlogout)$"
    },
    fullscreen = true
})

hl.window_rule({
    name = "fullscreen-cs2",
    match = {
        class = "^(cs2)$"
    },
    fullscreen = true
})

hl.window_rule({
    name = "fullscreen-worms",
    match = {
        class = "^(steam_app_327030)$"
    },
    fullscreen = true
})

hl.window_rule({
    name = "fullscreen-minecraft",
    match = {
        title = "^(.*Minecraft.*)$"
    },
    fullscreen = true
})

----------------------------------------------------------------
-- IMMEDIATE
----------------------------------------------------------------

hl.window_rule({
    name = "immediate-cs2",
    match = {
        class = "^(cs2)$"
    },
    immediate = true
})

hl.window_rule({
    name = "immediate-worms",
    match = {
        class = "^(steam_app_327030)$"
    },
    immediate = true
})

hl.window_rule({
    name = "immediate-minecraft",
    match = {
        title = "^(.*Minecraft.*)$"
    },
    immediate = true
})

----------------------------------------------------------------
-- IDLE INHIBIT
----------------------------------------------------------------

hl.window_rule({
    name = "idleinhibit-mpv",
    match = {
        class = "^(mpv)$"
    },
    idle_inhibit = "focus"
})

hl.window_rule({
    name = "idleinhibit-brave",
    match = {
        class = "^(brave-browser)$"
    },
    idle_inhibit = "fullscreen"
})

----------------------------------------------------------------
-- SIZE
----------------------------------------------------------------

hl.window_rule({
    name = "size-network-connections",
    match = {
        title = "^(Network Connections)$"
    },
    size = "400 600"
})

hl.window_rule({
    name = "size-btop",
    match = {
        title = "^(btop)$"
    },
    size = "980 530"
})

hl.window_rule({
    name = "size-volume-control",
    match = {
        title = "^(Volume Control)$"
    },
    size = "800 600"
})

hl.window_rule({
    name = "size-feh",
    match = {
        title = "^(feh)$"
    },
    size = "1280 720"
})

hl.window_rule({
    name = "size-download",
    match = {
        class = "^(download)$"
    },
    size = "800 600"
})

hl.window_rule({
    name = "size-open-file",
    match = {
        title = "^(Open File)$"
    },
    size = "800 600"
})

hl.window_rule({
    name = "size-save-file",
    match = {
        title = "^(Save File)$"
    },
    size = "800 600"
})

hl.window_rule({
    name = "size-bitwarden",
    match = {
        class = "^(brave%-nngceckbapebfimnlniiiahkandclblb%-Default)$"
    },
    size = "800 800"
})

hl.window_rule({
    name = "size-polychromatic",
    match = {
        class = "^(polychromatic)$"
    },
    size = "1280 1000"
})

hl.window_rule({
    name = "size-brave-open-popup",
    match = {
        title = "^(.*wants to open.*)$"
    },
    size = "1280 1000"
})

hl.window_rule({
    name = "size-brave-save-popup",
    match = {
        title = "^(.*wants to save.*)$"
    },
    size = "1280 1000"
})

hl.window_rule({
    name = "size-teamspeak",
    match = {
        title = "^(TeamSpeak)$"
    },
    size = "1200 800"
})

hl.window_rule({
    name = "size-picture-in-picture",
    match = {
        title = "^(Picture%-in%-picture)$"
    },
    size = "580 330"
})

----------------------------------------------------------------
-- MOVE
----------------------------------------------------------------

hl.window_rule({
    name = "move-btop",
    match = {
        title = "^(btop)$"
    },
    move = "3% 35"
})

hl.window_rule({
    name = "move-network-connections",
    match = {
        title = "^(Network Connections)$"
    },
    move = "70% 35"
})

hl.window_rule({
    name = "move-volume-control",
    match = {
        title = "^(Volume Control)$"
    },
    move = "75 44%"
})

hl.window_rule({
    name = "move-picture-in-picture",
    match = {
        title = "^(Picture%-in%-picture)$"
    },
    move = "1900 1050"
})

----------------------------------------------------------------
-- CENTER
----------------------------------------------------------------

local centered_classes = {
    "^(vesktop)$",
    "^(discord)$",
    "^(slack)$",
    "^(teams%-for%-linux)$",
    "^(polychromatic)$",
    "^(YouTube Music Desktop App)$",
    "^(brave%-irc%.ax%-servers%.hu__%-Default)$",
    "^(brave%-nngceckbapebfimnlniiiahkandclblb%-Default)$",
}

for _, class in ipairs(centered_classes) do
    hl.window_rule({
        name = "center-class-" .. class,
        match = {
            class = class
        },
        center = true
    })
end

local centered_titles = {
    "^(Volume Control)$",
    "^(.*wants to open.*)$",
    "^(.*wants to save.*)$",
    "^(TeamSpeak)$",
}

for _, title in ipairs(centered_titles) do
    hl.window_rule({
        name = "center-title-" .. title,
        match = {
            title = title
        },
        center = true
    })
end

----------------------------------------------------------------
-- ANIMATIONS
----------------------------------------------------------------

local slide_titles = {
    "^(btop)$",
    "^(Network Connections)$",
    "^(Volume Control)$",
    "^(Logout)$",
}

for _, title in ipairs(slide_titles) do
    hl.window_rule({
        name = "slide-" .. title,
        match = {
            title = title
        },
        animation = "slide"
    })
end

----------------------------------------------------------------
-- WORKSPACES
----------------------------------------------------------------

hl.window_rule({
    name = "workspace-cs2",
    match = {
        class = "^(cs2)$"
    },
    workspace = "1"
})

hl.window_rule({
    name = "workspace-worms",
    match = {
        class = "^(steam_app_327030)$"
    },
    workspace = "1"
})

hl.window_rule({
    name = "workspace-minecraft",
    match = {
        title = "^(.*Minecraft.*)$"
    },
    workspace = "1"
})

hl.window_rule({
    name = "workspace-brave",
    match = {
        class = "^(brave-browser)$"
    },
    workspace = "1"
})

hl.window_rule({
    name = "workspace-vesktop",
    match = {
        class = "^(vesktop)$"
    },
    workspace = "4"
})

hl.window_rule({
    name = "workspace-discord",
    match = {
        class = "^(discord)$"
    },
    workspace = "4"
})

hl.window_rule({
    name = "workspace-slack",
    match = {
        class = "^(slack)$"
    },
    workspace = "5"
})

hl.window_rule({
    name = "workspace-teams",
    match = {
        class = "^(teams%-for%-linux)$"
    },
    workspace = "6"
})

hl.window_rule({
    name = "workspace-thelounge",
    match = {
        class = "^(brave%-irc%.ax%-servers%.hu__%-Default)$"
    },
    workspace = "3"
})

----------------------------------------------------------------
-- SPECIAL APPLICATION RULES
----------------------------------------------------------------

hl.window_rule({
    name = "brave-main",
    match = {
        class = "^(brave-browser)$"
    },
    tile = true,
    min_size = "1 1",
    opacity = "1 1 1"
})

hl.window_rule({
    name = "steam-minsize",
    match = {
        class = "^(steam)$"
    },
    min_size = "1 1"
})

hl.window_rule({
    name = "teamspeak-minsize",
    match = {
        title = "^(TeamSpeak)$"
    },
    min_size = "1 1"
})

hl.window_rule({
    name = "picture-in-picture",
    match = {
        title = "^(Picture%-in%-picture)$"
    },
    float = true,
    pin = true
})

----------------------------------------------------------------
-- XWAYLANDVIDEOBRIDGE
----------------------------------------------------------------

hl.window_rule({
    name = "xwaylandvideobridge",
    match = {
        class = "^(xwaylandvideobridge)$"
    },
    opacity = "0.0 override 0.0 override",
    no_anim = true,
    no_focus = true
})
