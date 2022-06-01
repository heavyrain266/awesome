-- Layout related keybindings

local awful = require("awful")

awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { Mod, "Shift" },
		key = "j",
		group = "Layout",
		description = "Swap with next client by index",
		on_press = function()
			awful.client.swap.byidx(1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Shift" },
		key = "k",
		group = "Layout",
		description = "Swap with previous client by index",
		on_press = function()
			awful.client.swap.byidx(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod },
		key = "u",
		group = "Client",
		description = "Jump to urgent client",
		on_press = awful.client.urgent.jumpto,
	}),
	awful.key({
		modifiers = { Mod },
		key = "l",
		group = "Layout",
		description = "Decrease master width factor",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod },
		key = "h",
		group = "Layout",
		description = "Decrease master width factor",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Shift" },
		key = "h",
		group = "Layout",
		description = "Increase number of master clients",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Shift" },
		key = "l",
		group = "Layout",
		description = "Decrease number of master clients",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Control" },
		key = "h",
		group = "Layout",
		description = "Increase number of columns",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Control" },
		key = "l",
		group = "Layout",
		description = "Decrease number of columns",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
	awful.key({
		modifiers = { Mod },
		key = "space",
		group = "Layout",
		description = "Select next",
		on_press = function()
			awful.layout.inc(1)
		end,
	}),
	awful.key({
		modifiers = { Mod, "Shift" },
		key = "space",
		group = "Layout",
		description = "Select previous",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
})
