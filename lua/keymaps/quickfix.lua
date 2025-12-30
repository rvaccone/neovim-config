-- Import required modules
local map = require("utils.keymap").map

map("<leader>co", "<cmd>cope<cr>", "Open quickfix window")

map("<leader>cq", "<cmd>ccl<cr>", "Close quickfix window")

map("<leader>cn", "<cmd>cn<cr>", "Next quickfix item")

map("<leader>cp", "<cmd>cp<cr>", "Previous quickfix item")
