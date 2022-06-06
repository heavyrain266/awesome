-- Awesome related keybinds

local awful = require "awful"
local menubar = require "menubar"

local hotkeys_popup = require "awful.hotkeys_popup"

awful.keyboard.append_global_keybindings {
  awful.key {
    modifiers = { Mod },
    key = "s",
    group = "Awesome",
    description = "Show help",
    on_press = hotkeys_popup.show_help,
  },
  awful.key {
    modifiers = { Mod, "Control" },
    key = "r",
    group = "Awesome",
    description = "Restart awesome",
    on_press = awesome.restart,
  },
  awful.key {
    modifiers = { Mod, "Shift" },
    key = "e",
    group = "Awesome",
    description = "Quit awesome",
    on_press = awesome.quit,
  },
  awful.key {
    modifiers = {},
    key = "Print",
    group = "Awesome",
    description = "Take screenshot",
    on_press = function()
      awful.spawn.with_shell "flameshot gui"
    end,
  },
  awful.key {
    modifiers = { Mod, "Shift" },
    key = "Return",
    group = "Awesome",
    description = "Spawn terminal",
    on_press = function()
      awful.spawn.with_shell(Terminal)
    end,
  },
  awful.key {
    modifiers = { Mod },
    key = "p",
    group = "Awesome",
    description = "Show menubar",
    on_press = function()
      menubar.show()
    end,
  },
}
