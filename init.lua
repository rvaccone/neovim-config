-- Setup localized vim variables
local g = vim.g

-- Set the leader key
g.mapleader = " "

-- Install plugins
require("aggregators/plugins").aggregate()

-- Apply Vim settings
require("vim_settings").apply()

-- LSP setup
require("ui").setup()

-- Load 2Vim and user keymaps
require("aggregators/keymaps").aggregate()
