-- Setup localized vim variables
local keymap = vim.keymap

-- Telescope builtin
local builtin = require("telescope.builtin")

-- Search operations
keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Open file search" })
keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Project search" })
keymap.set("n", "<leader>ss", builtin.current_buffer_fuzzy_find, { desc = "File search" })
keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Word search" })

-- Buffer operations
keymap.set("n", "<leader>bo", builtin.buffers, { desc = "Open buffer list" })

-- Help operations
keymap.set("n", "<leader>ho", builtin.help_tags, { desc = "Open help search" })
