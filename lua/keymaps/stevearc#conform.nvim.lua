-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap

-- Create autocmd group
local group = api.nvim_create_augroup("CodeTools", { clear = true })

api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "python",
	callback = function(event)
		keymap.set("n", "<leader>it", function()
			require("conform").format({ bufnr = event.buf, formatters = { "ruff", "black" } })
		end, { desc = "Organize imports", buffer = event.buf })
	end,
})
