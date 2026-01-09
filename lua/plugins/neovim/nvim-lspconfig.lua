-- Setup localized vim variables
local api = vim.api
local lsp = vim.lsp

return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Import required modules
		local map = require("utils.keymap").map
		local notify = vim.notify -- Needs to be set here for nvim-notify

		-- Define lsp config
		lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
			root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			init_options = {
				hostInfo = "neovim",
			},
			on_attach = function(_, bufnr)
				-- Add missing imports
				map("<leader>im", function()
					lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source" },
							diagnostics = lsp.diagnostic.get_line_diagnostics(),
						},
						filter = function(action)
							return action.title:match("Add all missing imports")
						end,
					})
					notify("Added missing imports")
				end, "Add missing imports", { buffer = bufnr })

				-- Organize imports
				map("<leader>io", function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { api.nvim_buf_get_name(0) },
					}

					lsp.buf_request_sync(0, "workspace/executeCommand", params, 1000)
					notify("Organized imports")
				end, "Organize imports", { buffer = bufnr })
			end,
		})

		-- Enable ts_ls for all matching buffers
		lsp.enable("ts_ls")
	end,
}
