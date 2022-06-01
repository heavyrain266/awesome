-- TODO: Expand notification rules?

local ruled = require("ruled")
local awful = require("awful")

-- Notification-wise rules
ruled.notification.connect_signal("request::rules", function()
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		},
	})
end)
