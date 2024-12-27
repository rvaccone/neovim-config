-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
keymap.set("n", "<leader>0", "<cmd>NvimTreeFocus<cr>", { desc = "Toggle NvimTree" })
