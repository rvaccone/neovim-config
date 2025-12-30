-- Setup localized vim variables
local v = vim.v

-- Import required modules
local map = require("utils.keymap").map

map("j", function()
	return v.count > 0 and "j" or "gj"
end, "Move down by visual line or real with count", { expr = true })

map("k", function()
	return v.count > 0 and "k" or "gk"
end, "Move up by visual line or real with count", { expr = true })
