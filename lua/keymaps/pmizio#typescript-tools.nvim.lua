-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap

-- Create autocmd group
local group = api.nvim_create_augroup("TypeScriptTools", { clear = true })

-- Setup TypeScript-specific keymaps
api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	callback = function(event)
		keymap.set(
			"n",
			"<leader>im",
			"<cmd>TSToolsAddMissingImports<cr>",
			{ desc = "TSTools add missing imports", buffer = event.buf }
		)
		keymap.set(
			"n",
			"<leader>it",
			"<cmd>TSToolsOrganizeImports<cr>",
			{ desc = "TSTools organize imports", buffer = event.buf }
		)
	end,
})
