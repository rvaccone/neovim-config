-- Setup localized vim variables
local keymap = vim.keymap

-- Import cmp module
local cmp = require("cmp")

-- <cr> needs to be set under lua/lsp.lua to work properly
keymap.set("i", "<s-cr>", cmp.mapping.abort(), { desc = "Abort completion" })
keymap.set("i", "<c-n>", cmp.mapping.select_next_item(), { desc = "Select next completion item" })
keymap.set("i", "<c-p>", cmp.mapping.select_prev_item(), { desc = "Select previous completion item" })
