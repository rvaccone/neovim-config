-- Setup localized vim variables
local diagnostic = vim.diagnostic
local lsp = vim.lsp

local M = {}

--- Function to setup UI elements
---@return nil
function M.setup()
	-- Configure LSP floating windows
	local win_opts = { border = "rounded" }
	for name, handler in pairs(lsp.handlers) do
		if type(handler) == "function" then
			lsp.handlers[name] = lsp.with(handler, win_opts)
		end
	end

	-- Override open_floating_preview to use borders
	local original_open_floating_preview = lsp.util.open_floating_preview
	lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return original_open_floating_preview(contents, syntax, opts, ...)
	end

	-- Configure diagnostics display
	diagnostic.config({
		virtual_text = true,
		signs = false,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			header = "",
			prefix = "",
		},
	})
end

return M
