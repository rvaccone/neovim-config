-- Setup localized vim variables
local keymap = vim.keymap
local tbl_extend = vim.tbl_extend

local M = {}

--- For lazy.nvim `keys` field
---@param lhs string left-hand side (the key combo)
---@param rhs string|function right-hand side (the action)
---@param desc string description
---@param opts? table optional overrides
function M.lazy_key(lhs, rhs, desc, opts)
	return tbl_extend("force", {
		lhs,
		rhs,
		desc = desc,
		mode = "n",
		noremap = true,
		silent = true,
	}, opts or {})
end

--- For vim.keymap.set
---@param lhs string left-hand side (the key combo)
---@param rhs string|function right-hand side (the action)
---@param desc string description
---@param opts? table optional overrides (mode, buffer, etc.)
function M.map(lhs, rhs, desc, opts)
	local options = tbl_extend("force", {
		desc = desc,
		noremap = true,
		silent = true,
	}, opts or {})

	local mode = options.mode or "n"
	options.mode = nil

	keymap.set(mode, lhs, rhs, options)
end

return M
