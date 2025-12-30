-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap
local notify = vim.notify

-- Create autocmd group
local group = api.nvim_create_augroup("CodeTools", { clear = true })

-- Import conform
local conform = require("conform")

api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "python",

	---@param event table
	---@return nil
	callback = function(event)
		---@return nil
		local function organize_imports()
			conform.format({ bufnr = event.buf, formatters = { "ruff", "black" } })
			notify("Organized imports")
		end

		keymap.set("n", "<leader>io", organize_imports, { desc = "Organize imports", buffer = event.buf })
	end,
})
