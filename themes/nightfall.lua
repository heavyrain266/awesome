-- TODO: Port my theme from kakoune

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
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

nightfall.useless_gap = dpi(10)
nightfall.border_width = dpi(0)
nightfall.border_color_normal = "#000000"
nightfall.border_color_active = "#535d6c"
nightfall.border_color_marked = "#91231c"

-- Generate taglist squares:
local taglist_square_size = dpi(4)

nightfall.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, nightfall.fg_normal)
nightfall.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, nightfall.fg_normal)

nightfall.menu_submenu_icon = themes_path .. "default/submenu.png"
nightfall.menu_height = dpi(15)
nightfall.menu_width = dpi(100)

-- Define the image to load
-- stylua: ignore start
nightfall.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
nightfall.titlebar_close_button_focus = themes_path.."default/titlebar/close_focus.png"

nightfall.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
nightfall.titlebar_minimize_button_focus = themes_path.."default/titlebar/minimize_focus.png"

nightfall.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
nightfall.titlebar_ontop_button_focus_inactive = themes_path.."default/titlebar/ontop_focus_inactive.png"
nightfall.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
nightfall.titlebar_ontop_button_focus_active = themes_path.."default/titlebar/ontop_focus_active.png"

nightfall.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
nightfall.titlebar_sticky_button_focus_inactive = themes_path.."default/titlebar/sticky_focus_inactive.png"
nightfall.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
nightfall.titlebar_sticky_button_focus_active = themes_path.."default/titlebar/sticky_focus_active.png"

nightfall.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
nightfall.titlebar_floating_button_focus_inactive = themes_path.."default/titlebar/floating_focus_inactive.png"
nightfall.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
nightfall.titlebar_floating_button_focus_active = themes_path.."default/titlebar/floating_focus_active.png"

nightfall.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
nightfall.titlebar_maximized_button_focus_inactive = themes_path.."default/titlebar/maximized_focus_inactive.png"
nightfall.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
nightfall.titlebar_maximized_button_focus_active = themes_path.."default/titlebar/maximized_focus_active.png"

nightfall.wallpaper = wallpaper_path .. "themes/assets/ocean.jpg"
-- stylua: ignore end

-- You can use your own layout icons like this:
nightfall.layout_fairh = themes_path .. "default/layouts/fairhw.png"
nightfall.layout_fairv = themes_path .. "default/layouts/fairvw.png"
nightfall.layout_floating = themes_path .. "default/layouts/floatingw.png"
nightfall.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
nightfall.layout_max = themes_path .. "default/layouts/maxw.png"
nightfall.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
nightfall.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
nightfall.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
nightfall.layout_tile = themes_path .. "default/layouts/tilew.png"
nightfall.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
nightfall.layout_spiral = themes_path .. "default/layouts/spiralw.png"
nightfall.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
nightfall.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
nightfall.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
nightfall.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
nightfall.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
nightfall.awesome_icon = theme_assets.awesome_icon(nightfall.menu_height, nightfall.bg_focus, nightfall.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
nightfall.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = {
			urgency = "critical",
		},
		properties = {
			bg = "#ff0000",
			fg = "#ffffff",
		},
	})
end)

return nightfall
