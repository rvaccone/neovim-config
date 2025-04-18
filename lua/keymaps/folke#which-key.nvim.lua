-- Setup localized vim variables
local keymap = vim.keymap

-- Import which-key module
local which_key = require("which-key")

keymap.set(
	"n",
	"<leader>?",
	---@return nil
	function()
		which_key.show({ global = false })
	end,
	{ desc = "Buffer local keymaps" }
)
