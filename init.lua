-- Setup localized vim variables
local g = vim.g

-- Set the leader key
g.mapleader = " "

-- Install plugins
require("aggregators/plugins").aggregate()

-- Apply Vim settings
require("vim_settings").apply()

-- UI setup
require("ui").setup()

-- Load keymaps
require("aggregators/keymaps").aggregate()
