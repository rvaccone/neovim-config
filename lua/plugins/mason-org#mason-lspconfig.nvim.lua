-- Setup localized vim variables
local api = vim.api
local lsp = vim.lsp

return {
	"mason-org/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
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
				"pyright",
				"ruff",
				"rust_analyzer",
				"sqlls",
				"tailwindcss",
				"texlab",
				"vimls",
				"yamlls",
			},
			automatic_enable = {
				exclude = { "pyright", "lua_ls" },
			},
		})

		-- Manual configuration for language servers for customization
		lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		lsp.config("pyright", {
			settings = {
				python = {
					analysis = {
						diagnosticMode = "workspace",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
				},
			},
		})
	end,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				max_concurrent_installers = 10,
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
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
				},
				auto_update = true, -- Automatically update tools
				run_on_start = true, -- Install missing tools on startup
			},
		},
		{ "neovim/nvim-lspconfig" },
	},
}
