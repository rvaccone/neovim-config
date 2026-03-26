-- Setup localized vim variables
local api = vim.api

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			sh = { "shfmt" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			latex = { "tex-fmt" },
			tex = { "tex-fmt" },
			plaintex = { "tex-fmt" },
			python = { "ruff_format" },
			sql = { "sqruff" },
			["*"] = { "trim_whitespace" },
			["_"] = { "trim_newlines" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		notify_on_error = true,
		stop_after_first = true,
	},
	config = function(_, opts)
		require("conform").setup(opts)
		local map = require("utils.keymap").map

		api.nvim_create_autocmd("FileType", {
			group = api.nvim_create_augroup("ConformPython", { clear = true }),
			pattern = "python",
			callback = function(event)
				map("<leader>io", function()
					require("conform").format({ bufnr = event.buf, formatters = { "ruff_organize_imports" } })
					vim.notify("Organized imports")
				end, "Python organize imports", { buffer = event.buf })
			end,
		})
	end,
}
