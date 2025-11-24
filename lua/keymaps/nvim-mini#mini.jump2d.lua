-- Setup localized vim variables
local keymap = vim.keymap

-- Load the modules
local jump2d = require("mini.jump2d")

keymap.set("n", "<del>", function()
	jump2d.start({
		allowed_windows = {
			not_current = true,
		},
	})
end, { desc = "Quick jump across windows", noremap = true, silent = true })
