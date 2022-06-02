-- Autostart selected stuff

local awful = require "awful"

-- Check if file/dir exists
function exists(path)
    local ok = os.rename(path, path)

    if ok == nil then
        if ok == 17 then
            return true
        end
        return false
    end
    return true
end

if not exists "./bling" then
    os.execute "git submodule update --init"
end

local cmds = {
    "xset -b",
    "redshift -P -O 4600",
    "setxkbmap -option caps:hyper",
    "picom -b --experimental-backends",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
}

for cmd = 1, #cmds do
    awful.spawn.single_instance(cmds[cmd], awful.rules.rules)
end
