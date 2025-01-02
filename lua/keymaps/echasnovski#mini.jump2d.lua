-- Setup localized vim variables
local keymap = vim.keymap

keymap.set({ "n", "x", "o" }, "<leader>s", "<cmd>lua MiniJump2d.start()<cr>")
