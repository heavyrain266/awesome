local naughty = require "naughty"

local bling = require "bling"
local playerctl = bling.signal.playerctl.lib()

-- Flash focus
-- bling.module.flash_focus.enable()

-- Music notifications
playerctl:connect_signal(
  "metadata",
  function(_, title, artist, album_path, album, new, player_name)
    if new == true then
      naughty.notify { title = title, text = artist, image = album_path }
    end
  end
)

-- TODO: Music control widget
-- TODO: Tag previw widget
