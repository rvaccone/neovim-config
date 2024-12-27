-- Setup localized vim variables
local keymap = vim.keymap

keymap.set(
	"n",
	"<leader>a",
	"<cmd>lua vim.lsp.buf.code_action()<cr>",
	{ desc = "LSP code action", noremap = true, silent = true }
)
keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP restart" })
