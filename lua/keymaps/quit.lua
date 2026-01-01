-- Import required modules
local map = require("utils.keymap").map

map("QQ", "<cmd>q!<cr>", "Quit without saving", { mode = { "n", "v" } })
