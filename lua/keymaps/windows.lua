-- Setup localized vim variables
local keymap = vim.keymap

-- Local modules
local windows = require("utils.windows")

-- Setup keymaps for window navigation
for index = 1, windows.windows_config.max_windows do
	-- Focusing or creating horizontal windows
	keymap.set("n", "<leader>" .. index, function()
		windows.focus_or_create_window(index, "vsplit")
	end, { desc = "Focus or create window " .. index, noremap = true, silent = true })

	-- Focusing or creating vertical windows
	keymap.set("n", "<leader>v" .. index, function()
		windows.focus_or_create_window(index, "split")
	end, { desc = "Focus or create vertical window " .. index, noremap = true, silent = true })

	-- Closing windows without saving
	keymap.set("n", "<leader>q" .. index, function()
		windows.operate_on_window(index, "q!")
	end, { desc = "Close window " .. index .. " without saving", noremap = true, silent = true })

	-- Closing windows with saving
	keymap.set("n", "<leader>z" .. index, function()
		windows.operate_on_window(index, "wq")
	end, { desc = "Close window " .. index .. " with saving", noremap = true, silent = true })
end
