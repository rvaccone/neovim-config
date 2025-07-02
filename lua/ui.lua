-- Setup localized vim variables
local diagnostic = vim.diagnostic

local M = {}

--- Function to setup UI elements
---@return nil
function M.setup()
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
