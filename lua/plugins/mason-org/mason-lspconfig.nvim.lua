return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			-- Language Servers
			"basedpyright",
			"bashls",
			"cssls",
			"docker_compose_language_service",
			"dockerls",
			"eslint",
			"graphql",
			"html",
			"jsonls",
			"lua_ls",
			"marksman",
			"ruff",
			"rust_analyzer",
			"sqlls",
			"tailwindcss",
			"texlab",
			"ts_ls",
			"vimls",
			"yamlls",
		},
		automatic_enable = {
			exclude = { "ts_ls" },
		},
	},
	dependencies = {
		"mason-org/mason.nvim",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					-- Linters
					"eslint_d",
					"hadolint",
					"luacheck",
					"pylint",
					"shellcheck",
					"sqruff",
					"typos",

					-- Formatters
					"black",
					"shfmt",
					"sqlfmt",
					"tex-fmt",
					"stylua",
					"prettier",

					-- Tools
					"yq",
				},
				auto_update = true, -- Automatically update tools
				run_on_start = true, -- Install missing tools on startup
			},
		},
		{ "neovim/nvim-lspconfig" },
	},
}
