-- Load luarocks modules when possible
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require "gears"
local awful = require "awful"
require "awful.autofocus"

-- Widget and layout library
local wibox = require "wibox"

-- Theme handling library
local beautiful = require "beautiful"

-- Notification library
local naughty = require "naughty"

-- Declarative object management
local menubar = require "menubar"
local hotkeys_popup = require "awful.hotkeys_popup"

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title = "Oops, an error happened"
      .. (startup and " during startup!" or "!"),
    message = message,
  }
end)

-- Default shell
awful.util.shell = "sh"

-- Initialize selected theme
beautiful.init(require "themes/nightfall")

-- Prevent memory leaks
gears.timer {
  timeout = 30,
  call_now = true,
  autostart = true,
  callback = function()
    collectgarbage("step", 1024)
    collectgarbage("setpause", 110)
    collectgarbage("setstepmul", 1000)
  end,
}

-- This is used later as the default terminal and editor to run.
Terminal = "alacritty"
Editor = os.getenv "EDITOR" or "kak"
Editor_cmd = Terminal .. " -e " .. Editor

Mod = "Mod4"

-- TODO: Move it into shell.mouse
-- Create a launcher widget and a main menu
Launcher_menu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end,
  },
  {
    "manual",
    Terminal .. " -e man awesome",
  },
  {
    "edit config",
    Editor_cmd .. " " .. awesome.conffile,
  },
  {
    "restart",
    awesome.restart,
  },
  {
    "quit",
    function()
      awesome.quit()
    end,
  },
}

mouse_menu = awful.menu {
  items = {
    {
      "awesome",
      Launcher_menu,
      beautiful.awesome_icon,
    },
    {
      "open terminal",
      Terminal,
    },
  },
}

Launcher = awful.widget.launcher {
  image = beautiful.awesome_icon,
  menu = mouse_menu,
}

-- Menubar configuration
menubar.utils.terminal = Terminal

-- Create a textclock widget
local text_clock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(1)
      end),
    },
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ Mod }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ Mod }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({}, 1, function(c)
        c:activate {
          context = "tasklist",
          action = "toggle_minimization",
        }
      end),
      awful.button({}, 3, function()
        awful.menu.client_list { theme = { width = 250 } }
      end),
      awful.button({}, 4, function()
        awful.client.focus.byidx(-1)
      end),
      awful.button({}, 5, function()
        awful.client.focus.byidx(1)
      end),
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen = s,
    widget = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        Launcher,
        s.mytaglist,
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        text_clock,
      },
    },
  }
end)

-- External: additional libraries
require "external.bling"

--[[
    Rules: all clients & notifications will follow them
    for example, firefox will not have titlebar.
]]
require "rules"

--[[
    Shell: provides UI elements like:
      - wibar
      - notifs
      - widgets
      - titlebars
]]
require "shell.titlebar"

--[[
    Signals: awesome will emit certain signals
    to e.g. request decorations which allow setting up
    titlebars, wallpapers, tags and more
]]
require "signals"

-- Seat: input conifugration
require "seats"

--[[
    Utils: simple utility scripts
      - maximize: maximize window by dragging it on top of the screen
      - autostart: table of programs and scripts which should start with awesome
]]
require "utils"
