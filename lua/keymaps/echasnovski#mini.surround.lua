-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "saa", "Vsa", { desc = "Add surrounding to current line" })
keymap.set("n", "sdd", "Vsd", { desc = "Delete surrounding on current line" })
keymap.set("n", "srr", "Vsr", { desc = "Replace surrounding on current line" })
