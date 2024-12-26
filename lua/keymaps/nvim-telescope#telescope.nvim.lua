-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap

-- Telescope builtin
local telescope_builtin = require("telescope.builtin")

keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })
