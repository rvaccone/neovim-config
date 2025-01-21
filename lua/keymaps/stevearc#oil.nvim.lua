-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" })
