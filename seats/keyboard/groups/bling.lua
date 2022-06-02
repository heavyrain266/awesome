local awful = require "awful"
local bling = require "bling"

awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { Mod, "Control" },
        key = "t",
        group = "Bling",
        description = "Enable tabbed mode",
        on_press = function()
            -- Why awesome sees this as nil value?
            bling.module.tabbed.pick()
        end,
    },
    awful.key {
        modifiers = { Mod, "Control", "Shift" },
        key = "t",
        group = "bling",
        description = "Remove window from tabbed mode",
        on_press = function()
            bling.module.tabbed.pop()
        end,
    },

    -- TODO: Add window swallowing?
}
