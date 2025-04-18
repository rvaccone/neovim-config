-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "j", "gj", { desc = "Move down by visual line", noremap = true, silent = true })

keymap.set("n", "k", "gk", { desc = "Move up by visual line", noremap = true, silent = true })
