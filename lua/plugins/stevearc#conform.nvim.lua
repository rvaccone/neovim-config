return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			bash = { "shfmt" },
			sh = { "shfmt" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
			lua = { "stylua" },
			latex = { "tex-fmt" },
			tex = { "tex-fmt" },
			plaintex = { "tex-fmt" },
			python = { "black" },
			sql = { "sqlfmt" },
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
		stop_after_first = true,
	},
}
