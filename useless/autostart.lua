-- Autostart selected stuff

local awful = require "awful"

local cmds = {
    "xset -b",
    "redshift -P -O 4600",
    "setxkbmap -option caps:hyper",
    "picom -b --experimental-backends",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
}

for cmd = 1, #cmds do
    awful.spawn.single_instance(cmds[cmd], awful.rules.rules)
end
