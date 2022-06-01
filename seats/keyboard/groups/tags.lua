-- Tags related keybinds

local awful = require "awful"

-- Switch tags with arrow keys
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { Mod },
        key = "Left",
        group = "Tags",
        description = "View previous",
        on_press = awful.tag.viewprev,
    },
    awful.key {
        modifiers = { Mod },
        key = "Right",
        group = "Tags",
        description = "View next",
        on_press = awful.tag.viewprev,
    },
    awful.key {
        modifiers = { Mod },
        key = "Down",
        group = "Tags",
        description = "Go back",
        on_press = awful.tag.history.restore,
    },
}

-- Switch tags & move clients with numbers
awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers = { Mod },
        keygroup = "numrow",
        description = "Only view tag",
        group = "Tags",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers = { Mod, "Control" },
        keygroup = "numrow",
        description = "Toggle tag",
        group = "Tags",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]

            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { Mod, "Shift" },
        keygroup = "numrow",
        description = "Move focused client to tag",
        group = "Tags",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]

                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers = { Mod, "Control", "Shift" },
        keygroup = "numrow",
        description = "Toggle focused client on tag",
        group = "Tags",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]

                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
}
