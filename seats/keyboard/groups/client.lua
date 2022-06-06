-- Client related keybinds

local awful = require "awful"

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings {
    awful.key {
      modifiers = { Mod },
      key = "f",
      group = "Client",
      description = "Toggle fullscreen",
      function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
    },
    awful.key {
      modifiers = { Mod, "Shift" },
      key = "q",
      group = "Client",
      description = "Close focused",
      on_press = function(c)
        c.kill(c)
      end,
    },
    awful.key {
      modifiers = { Mod, "Control" },
      key = "space",
      group = "Client",
      description = "Toggle floating",
      on_press = awful.client.floating.toggle,
    },
    awful.key {
      modifiers = { Mod, "Control" },
      key = "Return",
      group = "Client",
      description = "Move to master",
      on_press = function(c)
        c:swap(awful.client.getmaster())
      end,
    },
    awful.key {
      modifiers = { Mod },
      key = "t",
      group = "Client",
      description = "Toggle keep on top",
      function(c)
        c.ontop = not c.ontop
      end,
    },
    awful.key {
      modifiers = { Mod },
      key = "n",
      group = "Client",
      description = "minimize",
      on_press = function(c)
        c.minimized = true
      end,
    },
    awful.key {
      modifiers = { Mod },
      key = "m",
      group = "Client",
      description = "(un)maximize",
      on_press = function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
    },
    awful.key {
      modifiers = { Mod, "Control" },
      key = "m",
      group = "Client",
      description = "(un)minimize vertically",
      on_press = function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end,
    },
    awful.key {
      modifiers = { Mod, "Shift" },
      key = "m",
      group = "Client",
      description = "(un)minimize horizontally",
      on_press = function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end,
    },
  }
end)
