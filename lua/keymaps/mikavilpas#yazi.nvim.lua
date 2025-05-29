-- Setup localized vim variables
local keymap = vim.keymap

-- Search operations
keymap.set(
	{ "n", "v" },
	"<leader>-",
	"<cmd>Yazi<cr>",
	{ desc = "Open Yazi at the current file", noremap = true, silent = true }
)
