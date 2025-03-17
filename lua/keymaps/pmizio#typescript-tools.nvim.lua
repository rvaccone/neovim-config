-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap

-- Create autocmd group
local group = api.nvim_create_augroup("TypeScriptTools", { clear = true })

-- Setup TypeScript-specific keymaps
api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	callback = function(event)
		local function add_missing_imports()
			cmd("TSToolsAddMissingImports")
			print("Added missing imports")
		end

		local function organize_imports()
			cmd("TSToolsOrganizeImports")
			print("Organized imports")
		end

		keymap.set("n", "<leader>im", add_missing_imports, { desc = "TSTools add missing imports", buffer = event.buf })
		keymap.set("n", "<leader>io", organize_imports, { desc = "TSTools organize imports", buffer = event.buf })
	end,
})
