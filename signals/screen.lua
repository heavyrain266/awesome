local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"

-- Set wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            horizontal_fit_policy = "fit",
            vertical_fit_policy = "fit",
            image = beautiful.wallpaper,
            widget = wibox.widget.imagebox,
        },
    }
end)

-- Define tags
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag.add("1", {
        gap = 10,
        screem = s,
        selected = true,
        layout = awful.layout.suit.tile,
    })
    awful.tag.add("2", {
        gap = 10,
        screem = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("3", {
        gap = 10,
        screen = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("4", {
        gap = 10,
        screen = s,
        layout = awful.layout.suit.floating,
    })
    awful.tag.add("5", {
        gap = 10,
        screem = s,
        layout = awful.layout.suit.floating,
    })
end)
