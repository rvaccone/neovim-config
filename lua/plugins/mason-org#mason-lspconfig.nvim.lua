-- Setup localized vim variables
local api = vim.api
local log = vim.log
local notify = vim.notify
local tbl_deep_extend = vim.tbl_deep_extend

return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
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
		automatic_enable = true,
		handlers = {
			-- Default handler
			function(server_name)
				local server_config = {}
				local M_lspconfig = require("lspconfig")
				if M_lspconfig[server_name] and M_lspconfig[server_name].setup then
					M_lspconfig[server_name].setup(server_config)
				else
					notify("LSPConfig: No default setup found for " .. server_name, log.levels.WARN)
				end
			end,

			-- Override handlers for specific servers
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = api.nvim_get_runtime_file("", true), checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				})
			end,

			-- pmizio#typescript-tools.nvim.lua is handling this LSP
			["ts_ls"] = function() end,
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				max_concurrent_installers = 8,
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
					"eslint_d", -- JavaScript/TypeScript
					"hadolint", -- Dockerfile
					"luacheck", -- Lua
					"pylint", -- Python
					"shellcheck", -- Shell
					"sqruff", -- SQL
					"typos", -- Spell checker

					-- Formatters
					"black", -- Python
					"ruff", -- Python
					"shfmt", -- Shell
					"sqlfmt", -- SQL
					"tex-fmt", -- LaTeX
					"stylua", -- Lua
					"prettier", -- JavaScript/TypeScript
					"prettierd", --  JavaScript/TypeScript
				},
				auto_update = true,
			},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				local lspconfig_defaults = require("lspconfig").util.default_config
				lspconfig_defaults.capabilities = tbl_deep_extend(
					"force",
					lspconfig_defaults.capabilities or {},
					require("cmp_nvim_lsp").default_capabilities()
				)
			end,
		},
	},
}
