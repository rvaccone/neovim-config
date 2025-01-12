return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
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
			sh = { "shfmt" },
			bash = { "shfmt" },
			["*"] = { "trim_whitespace" },
			["_"] = { "trim_newlines" },
		},
		formatters = {
			ruff = {
				command = "ruff",
				args = {
					"check",
					"--select=F401,I001", -- F401: unused imports, I001: unsorted imports
					"--fix",
					"--exit-zero",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
				stdin = true,
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		notify_on_error = true,
	},
}
