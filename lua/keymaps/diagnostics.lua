-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local diagnostic = vim.diagnostic

keymap.set("n", "<leader>df", function()
	---@class FloatOpts
	---@field border "rounded"|"single"|"double"|"shadow"|"none"
	---@field focusable boolean
	---@field close_events string[]
	local float_opts = {
		border = "rounded",
		focusable = true,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
	}

	-- Get the diagnostic message at the cursor
	local diagnostics = diagnostic.get(0, { lnum = api.nvim_win_get_cursor(0)[1] - 1 })
	if diagnostics and #diagnostics > 0 then
		-- Copy the first diagnostic message to clipboard
		fn.setreg("+", diagnostics[1].message)
	end

	-- Show the float as usual
	diagnostic.open_float(float_opts)
end, { desc = "Float diagnostic message and copy to clipboard" })

keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
