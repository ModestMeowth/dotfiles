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

return config
