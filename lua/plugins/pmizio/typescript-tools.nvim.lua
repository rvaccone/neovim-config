-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local notify = vim.notify

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		settings = {
			expose_as_code_action = "all",
		},
	},
	config = function(_, opts)
		require("typescript-tools").setup(opts)
		local map = require("utils.keymap").map

		api.nvim_create_autocmd("FileType", {
			group = api.nvim_create_augroup("TypeScriptTools", { clear = true }),
			pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },

			callback = function(event)
				map("<leader>im", function()
					cmd("TSToolsAddMissingImports")
					notify("Added missing imports")
				end, "TypeScript add missing imports", { buffer = event.buf })

				map("<leader>io", function()
					cmd("TSToolsOrganizeImports")
					notify("Organized imports")
				end, "TypeScript organize imports", { buffer = event.buf })
			end,
		})
	end,
}
