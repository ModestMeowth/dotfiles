local wt = require "wezterm"
local act = wt.action

return {
    {
        key = "b",
        mods = "LEADER|CTRL",
        action = act.SendKey {
            key = 'b',
            mods = 'CTRL'
        },
    },
   {
        key = "%",
        mods = "LEADER",
        action = act.SplitHorizontal {
            domain = "CurrentPaneDomain",
        },
    },
    {
        key = "\"",
        mods = "LEADER",
        action  = act.SplitVertical {
            domain = "CurrentPaneDomain",
        },
    },
    {
        key = "n",
        mods = "LEADER",
        action = act.SpawnTab "CurrentPaneDomain",
    },
    {
        key = "c",
        mods = "LEADER",
        action = act.TogglePaneZoomState,
    },
    {
        key = "h",
        mods = "LEADER",
        action = act.ActivatePaneDirection "Left",
    },
    {
        key = "j",
        mods = "LEADER",
        action = act.ActivatePaneDirection "Down",
    },
    {
        key = "k",
        mods = "LEADER",
        action = act.ActivatePaneDirection "Up",
    },
    {
        key = "l",
        mods = "LEADER",
        action = act.ActivatePaneDirection "Right",
    },
    {
        key = "H",
        mods = "LEADER",
        action = act.AdjustPaneSize {"Left", 1},
    },
    {
        key = "J",
        mods = "LEADER",
        action = act.AdjustPaneSize {"Down", 1},
    },
    {
        key = "K",
        mods = "LEADER",
        action = act.AdjustPaneSize {"Up", 1},
    },
    {
        key = "L",
        mods = "LEADER",
        action = act.AdjustPaneSize {"Right", 1},
    },
}
