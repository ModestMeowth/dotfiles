local wt = require"wezterm"
local config = {}
if wt.config_builder then
    config = wt.config_builder()
end

local wayland_gnome = require"wayland_gnome"
wayland_gnome.apply_to_config(config)

config.color_scheme = "Dracula (Official)"

config.font_size = 11.0
config.font = wt.font {
    family = "NotoSansM Nerd Font Mono",
    weight = "DemiBold"
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_close_confirmation = "NeverPrompt"

config.hyperlink_rules = wt.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = "https://github.com/$1/$3",
})

config.leader = {
    key = 'b',
    mods = 'CTRL',
    timeout_milliseconds = 1000,
}

config.keys = {
    {
        key = 'b',
        mods = 'LEADER|CTRL',
        action = wt.action.SendKey {
            key = 'a',
            mods = 'CTRL'
        },
    },
    {
        key = '%',
        mode = "LEADER",
        action = wt.action.SplitHorizontal {
        },
    },
    {
        key = '"',
        mode = "LEADER",
        action  = wt.action.SplitVertical {
        },
    },
}

return config
