-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>co", "<cmd>cope<cr>", { desc = "Open quickfix window" })
keymap.set("n", "<leader>cq", "<cmd>ccl<cr>", { desc = "Close quickfix window" })
keymap.set("n", "<leader>cn", "<cmd>cn<cr>", { desc = "Next quickfix item" })
keymap.set("n", "<leader>cp", "<cmd>cp<cr>", { desc = "Previous quickfix item" })
