-- Setup localized vim variables
local keymap = vim.keymap

keymap.set(
	{ "n", "v" },
	"<leader>-",
	"<cmd>Oil --float<cr>",
	{ desc = "Open Oil at the current file", noremap = true, silent = true }
)
