local naughty = require "naughty"

-- Display notification(s).
naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- TODO: more singnals.
