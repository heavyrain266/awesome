-- Focus related keybindings

local awful = require "awful"

awful.keyboard.append_global_keybindings {
  awful.key {
    modifiers = { Mod },
    key = "j",
    group = "Focus",
    description = "Focus next by index",
    on_press = function()
      awful.client.focus.byidx(1)
    end,
  },
  awful.key {
    modifiers = { Mod },
    key = "j",
    group = "Focus",
    description = "Focus previous by index",
    on_press = function()
      awful.client.focus.byidx(-1)
    end,
  },
  awful.key {
    modifiers = { Mod },
    key = "Tab",
    group = "Focus",
    description = "Go back",
    on_press = function()
      awful.client.focus.history.previous()

      if client.focus then
        client.focus:raise()
      end
    end,
  },
  awful.key {
    modifiers = { Mod, "Control" },
    key = "j",
    group = "Focus",
    description = "Focus next screen",
    on_press = function()
      awful.screen.focus_relative(1)
    end,
  },
  awful.key {
    modifiers = { Mod, "Control" },
    key = "k",
    group = "Focus",
    description = "Focus previous screen",
    on_press = function()
      awful.screen.focus_relative(-1)
    end,
  },
  awful.key {
    modifiers = { Mod, "n" },
    key = "n",
    group = "Focus",
    description = "Focus restored client",
    on_press = function()
      local cr = awful.client.restore()

      if cr then
        cr:activate {
          raise = true,
          context = "key.unminimize",
        }
      end
    end,
  },
}
