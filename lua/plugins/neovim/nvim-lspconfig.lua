-- Setup localized vim variables
local api = vim.api
local diagnostic = vim.diagnostic
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
					local diagnostics = {}
					for _, entry in
						ipairs(diagnostic.get(0, {
							lnum = api.nvim_win_get_cursor(0)[1] - 1,
						}))
					do
						if entry.user_data and entry.user_data.lsp then
							table.insert(diagnostics, entry.user_data.lsp)
						end
					end

					lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source" },
							diagnostics = diagnostics,
						},
						filter = function(action)
							return action.title:match("Add all missing imports")
						end,
					})
					notify("Added missing imports")
				end, "Add missing imports", { buffer = bufnr })

				-- Organize imports
				map("<leader>io", function()
					local client = (lsp.get_clients({ name = "ts_ls", bufnr = 0 }) or {})[1]
					if client then
						client:exec_cmd({
							title = "Organize Imports",
							command = "_typescript.organizeImports",
							arguments = { api.nvim_buf_get_name(0) },
						}, { bufnr = 0 })
					end
					notify("Organized imports")
				end, "Organize imports", { buffer = bufnr })
			end,
		})

		-- Enable ts_ls for all matching buffers
		lsp.enable("ts_ls")
	end,
}
