-- Setup localized vim variables
local api = vim.api
local highlight = vim.highlight
local opt_local = vim.opt_local

-- Import required modules
local map = require("utils.keymap").map

local M = {}

function M.setup()
	-- Highlight yanked text
	api.nvim_create_autocmd("TextYankPost", {
		group = api.nvim_create_augroup("highlight_yank", { clear = true }),
		callback = function()
			highlight.on_yank({ higroup = "Visual", timeout = 200 })
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

	-- Disable comment auto-wrapping
	api.nvim_create_autocmd("BufEnter", {
		group = api.nvim_create_augroup("disable_comment_autowrap", { clear = true }),
		callback = function()
			opt_local.formatoptions:remove({ "c", "r", "o" })
		end,
	})
end

return M
