-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap

-- Create autocmd group
local group = api.nvim_create_augroup("CodeTools", { clear = true })

api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = "python",
	callback = function(event)
		local function organize_imports()
			require("conform").format({ bufnr = event.buf, formatters = { "ruff", "black" } })
			print("Organized imports")
		end

		keymap.set("n", "<leader>io", organize_imports, { desc = "Organize imports", buffer = event.buf })
	end,
})
