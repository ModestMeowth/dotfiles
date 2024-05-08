local wt = require"wezterm"
local mod = {}

local function gsettings(key)
    return wt.run_child_process({
        "gsettings",
        "get",
        "org.gnome.desktop.interface",
        key
    })
end

function mod.apply_to_config(config)
    if wt.target_triple ~= "x86_64-unknown-linux-gnu" then
        return
    end

    local success,stdout,_

    success,stdout,_ = gsettings("cursor-theme")
    if success then
        config.xcursor_theme = stdout:gsub("'(.+)'\n", "%1")
    end

    success,stdout,_ = gsettings("cursor-size")
    if success then
        config.xcursor_size = tonumber(stdout)
    end

    config.enable_wayland = true

    if config.enable_wayland and os.getenv("WAYLAND_DISPLAY") then
        success,stdout,_ = gsettings("text-scaling-factor")
        if success then
            config.font_size = (config.font_size or 11.0) * tonumber(stdout)
        end
    end
end

return mod
