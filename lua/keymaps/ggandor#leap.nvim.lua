-- Setup localized vim variables
local keymap = vim.keymap

keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward)")
keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward)")
keymap.set({ "n", "x", "o" }, "<leader>gs", "<Plug>(leap-from-window)")
