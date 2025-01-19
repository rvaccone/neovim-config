-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>ya", "<cmd>%y<cr>", { desc = "Copy buffer to clipboard" })
