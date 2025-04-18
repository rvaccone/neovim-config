-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap
local notify = vim.notify

-- Create autocmd group
local group = api.nvim_create_augroup("TypeScriptTools", { clear = true })

-- Setup TypeScript-specific keymaps
api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },

	---@param event table
	---@return nil
	callback = function(event)
		---@return nil
		local function add_missing_imports()
			cmd("TSToolsAddMissingImports")
			notify("Added missing imports")
		end

		---@return nil
		local function organize_imports()
			cmd("TSToolsOrganizeImports")
			notify("Organized imports")
		end

		keymap.set("n", "<leader>im", add_missing_imports, { desc = "TSTools add missing imports", buffer = event.buf })

		keymap.set("n", "<leader>io", organize_imports, { desc = "TSTools organize imports", buffer = event.buf })
	end,
})
