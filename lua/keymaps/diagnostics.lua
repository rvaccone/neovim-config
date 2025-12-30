-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local diagnostic = vim.diagnostic
local notify = vim.notify

-- Import required modules
local map = require("utils.keymap").map

map("<leader>dy", function()
	-- Get the diagnostic message at the cursor
	local diagnostics = diagnostic.get(0, { lnum = api.nvim_win_get_cursor(0)[1] - 1 })
	if diagnostics and #diagnostics > 0 then
		-- Copy the first diagnostic message to clipboard
		fn.setreg("+", diagnostics[1].message)

		notify("Copied diagnostic message to clipboard")
	end
end, "Copy diagnostic message to clipboard")

map("<leader>dh", function()
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
end, "Float diagnostic message and copy to clipboard")

map("<leader>dp", function()
	diagnostic.jump({ count = -1, float = true })
end, "Go to previous diagnostic")

map("<leader>dn", function()
	diagnostic.jump({ count = 1, float = true })
end, "Go to next diagnostic")
