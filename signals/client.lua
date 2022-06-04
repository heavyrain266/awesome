local awful = require "awful"

-- Set every new client as slave
-- Prevent clients from being unreachable after screen count changes.
client.connect_signal("manage", function(c)
    if not awesome.startup then
        awful.client.setslave(c)
    end

    if
        awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position
    then
        awful.placement.no_offscreen(c)
    end
end)

-- Focus follows mouse
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
