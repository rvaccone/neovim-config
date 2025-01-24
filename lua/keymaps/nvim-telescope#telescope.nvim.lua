-- Setup localized vim variables
local keymap = vim.keymap

-- Telescope builtin
local builtin = require("telescope.builtin")

-- Search operations
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find with grep" })
keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find in file" })
keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer" })

-- Help operations
keymap.set("n", "<leader>ho", builtin.help_tags, { desc = "Open help search" })
