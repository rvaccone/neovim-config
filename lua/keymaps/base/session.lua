-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "QQ", "<cmd>q!<cr>", { desc = "Quit without saving" })
