-- Titlebar configuration

local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local xres = require "beautiful.xresources"

client.connect_signal("request::titlebars", function(c)
  local titlebar = awful.titlebar(c, { size = xres.apply_dpi(32) })

  local mouse = gears.table.join(
    awful.button({}, 1, function()
      client.focus = c
      c:raise()

      awful.mouse.client.move(c)
    end),
    awful.button({}, 3, function()
      client.focus = c
      c:raise()

      awful.mouse.client.resize(c)
    end)
  )

  -- TODO: Add graphical buttons?

  titlebar:setup {
    { -- Left
      buttons = mouse,
      layout = wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        align = "center",
        widget = awful.titlebar.widget.titlewidget(c),
      },
      buttons = mouse,
      layout = wibox.layout.flex.horizontal,
    },
    { -- Right
      layout = wibox.layout.fixed.horizontal(),
    },
    layout = wibox.layout.align.horizontal,
  }
end)
