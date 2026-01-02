-- Setup localized vim variables
local api = vim.api
local highlight = vim.highlight

local M = {}

function M.setup()
	-- Highlight yanked text
	api.nvim_create_autocmd("TextYankPost", {
		group = api.nvim_create_augroup("highlight_yank", { clear = true }),
		callback = function()
			highlight.on_yank({ higroup = "Visual", timeout = 200 })
		end,
	})
end

return M
