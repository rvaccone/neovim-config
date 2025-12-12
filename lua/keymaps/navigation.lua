-- Setup localized vim variables
local keymap = vim.keymap
local v = vim.v

keymap.set("n", "j", function()
	return v.count > 0 and "j" or "gj"
end, { expr = true, desc = "Move down by visual line or real with count", noremap = true, silent = true })

keymap.set("n", "k", function()
	return v.count > 0 and "k" or "gk"
end, { expr = true, desc = "Move up by visual line or real with count", noremap = true, silent = true })
