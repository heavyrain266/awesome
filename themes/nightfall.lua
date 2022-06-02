-- TODO: Port my theme from kakoune

local theme_assets = require "beautiful.theme_assets"
local xres = require "beautiful.xresources"
local rnotification = require "ruled.notification"

local gfs = require "gears.filesystem"
local themes_path = gfs.get_themes_dir()
local wallpaper_path = gfs.get_configuration_dir()

local nightfall = {}

nightfall.font = "JuliaMono Bold 9"

nightfall.bg_normal = "#222222"
nightfall.bg_focus = "#535d6c"
nightfall.bg_urgent = "#ff0000"
nightfall.bg_minimize = "#444444"
nightfall.bg_systray = nightfall.bg_normal

nightfall.fg_normal = "#aaaaaa"
nightfall.fg_focus = "#ffffff"
nightfall.fg_urgent = "#ffffff"
nightfall.fg_minimize = "#ffffff"

nightfall.useless_gap = xres.apply_dpi(10)
nightfall.border_width = xres.apply_dpi(0)
nightfall.border_color_normal = "#000000"
nightfall.border_color_active = "#535d6c"
nightfall.border_color_marked = "#91231c"

-- Generate taglist squares:
local taglist_square_size = xres.apply_dpi(4)

nightfall.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size,
    nightfall.fg_normal
)
nightfall.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    nightfall.fg_normal
)

nightfall.menu_submenu_icon = themes_path .. "default/submenu.png"
nightfall.menu_height = xres.apply_dpi(15)
nightfall.menu_width = xres.apply_dpi(100)

nightfall.wallpaper = wallpaper_path .. "themes/assets/ocean.jpg"

-- Generate Awesome icon:
nightfall.awesome_icon = theme_assets.awesome_icon(
    nightfall.menu_height,
    nightfall.bg_focus,
    nightfall.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
nightfall.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
    rnotification.append_rule {
        rule = {
            urgency = "critical",
        },
        properties = {
            bg = "#ff0000",
            fg = "#ffffff",
        },
    }
end)

return nightfall
