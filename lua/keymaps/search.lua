-- Import required modules
local map = require("utils.keymap").map

map("<leader>sr", ":%s/", "Start search and replace", { silent = false })

map("<leader>sr", ":s/", "Replace in visual selection", { mode = "v", silent = false })

map("<leader>sw", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Replace word under cursor", { silent = false })

map("<leader>sn", ":nohl<CR>", "Clear search highlighting")
