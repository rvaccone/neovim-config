-- Setup localized vim variables
local api = vim.api
local iter = vim.iter
local keymap = vim.keymap

-- Telescope builtin
local builtin = require("telescope.builtin")

--- Finds the window handle of the first open help window
---@return integer? win_handle
local function find_help_window()
	for win_handle in iter(api.nvim_list_wins()) do
		local buf_handle = api.nvim_win_get_buf(win_handle)
		if buf_handle and buf_handle > 0 then
			local success, result = pcall(api.nvim_buf_get_option, buf_handle, "buftype")
			if success and result == "help" then
				return win_handle
			end
		end
	end
	return nil
end

keymap.set("n", "<leader>hq", "<cmd>helpclose<cr>", { desc = "Close help window" })

keymap.set("n", "<leader>ho", function()
	local help_win = find_help_window()

	if help_win then
		api.nvim_set_current_win(help_win)
	else
		builtin.help_tags()
	end
end, { desc = "Focus help window or open help search" })
