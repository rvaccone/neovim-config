-- Setup localized vim variables
local api = vim.api
local highlight = vim.highlight

-- Import required modules
local map = require("utils.keymap").map

local M = {}

function M.setup()
	-- Highlight yanked text
	api.nvim_create_autocmd("TextYankPost", {
		group = api.nvim_create_augroup("highlight_yank", { clear = true }),
		callback = function()
			highlight.on_yank({ higroup = "Visual", timeout = 250 })
		end,
	})

	-- Close lazy window on escape
	api.nvim_create_autocmd("FileType", {
		group = api.nvim_create_augroup("lazy_filetype", { clear = true }),
		pattern = "lazy",
		callback = function(event)
			map("<esc>", "<cmd>close<cr>", "Close Lazy", { buffer = event.buf })
		end,
	})
end

return M
