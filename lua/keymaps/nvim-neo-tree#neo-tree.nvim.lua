-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })

keymap.set("n", "<leader>0", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })
