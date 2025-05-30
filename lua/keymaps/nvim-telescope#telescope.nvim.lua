-- Setup localized vim variables
local keymap = vim.keymap

-- Telescope builtin
local builtin = require("telescope.builtin")

-- Find operations
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files", noremap = true, silent = true })

keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find with grep", noremap = true, silent = true })

keymap.set(
	"n",
	"<leader>fs",
	builtin.current_buffer_fuzzy_find,
	{ desc = "Find in file", noremap = true, silent = true }
)

keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word", noremap = true, silent = true })

keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffer", noremap = true, silent = true })

keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostic", noremap = true, silent = true })

keymap.set("n", "<leader>fm", builtin.marks, { desc = "Search marks", noremap = true, silent = true })

keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last Telescope picker", noremap = true, silent = true })
