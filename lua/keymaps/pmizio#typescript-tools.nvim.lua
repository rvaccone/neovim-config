-- Setup localized vim variables
local keymap = vim.keymap

keymap.set('n', '<leader>tm', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'TSTools add missing imports' })
keymap.set('n', '<leader>to', '<cmd>TSToolsOrganizeImports<cr>', {desc = "TSTools organize imports"} )

