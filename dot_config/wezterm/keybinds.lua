local wt = require "wezterm"

return {
    {
        key = "b",
        mods = "LEADER|CTRL",
        action = wt.action.SendKey {
            key = 'b',
            mods = 'CTRL'
        },
    },
   {
        key = "%",
        mods = "LEADER",
        action = wt.action.SplitHorizontal {
            domain = "CurrentPaneDomain",
        },
    },
    {
        key = "\"",
        mods = "LEADER",
        action  = wt.action.SplitVertical {
            domain = "CurrentPaneDomain",
        },
    },
    {
        key = "n",
        mods = "LEADER",
        action = wt.action.SpawnTab "CurrentPaneDomain",
    },
    {
        key = "c",
        mods = "LEADER",
        action = wt.action.TogglePaneZoomState,
    },
    {
        key = "h",
        mods = "LEADER",
        action = wt.action.ActivatePaneDirection "Left",
    },
    {
        key = "j",
        mods = "LEADER",
        action = wt.action.ActivatePaneDirection "Down",
    },
    {
        key = "k",
        mods = "LEADER",
        action = wt.action.ActivatePaneDirection "Up",
    },
    {
        key = "l",
        mods = "LEADER",
        action = wt.action.ActivatePaneDirection "Right",
    },
    {
        key = "H",
        mods = "LEADER",
        action = wt.action.AdjustPaneSize {"Left", 1},
    },
    {
        key = "J",
        mods = "LEADER",
        action = wt.action.AdjustPaneSize {"Down", 1},
    },
    {
        key = "K",
        mods = "LEADER",
        action = wt.action.AdjustPaneSize {"Up", 1},
    },
    {
        key = "L",
        mods = "LEADER",
        action = wt.action.AdjustPaneSize {"Right", 1},
    },
}
