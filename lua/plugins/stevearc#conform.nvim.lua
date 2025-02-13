return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
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
		stop_after_first = true,
	},
}
