-- Setup localized vim variables
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local snippet = vim.snippet
local tbl_deep_extend = vim.tbl_deep_extend

local M = {}

---@return nil
function M.setup()
	-- Configure LSP window borders
	local win_opts = { border = "rounded" }
	for name, handler in pairs(vim.lsp.handlers) do
		if type(handler) == "function" then
			lsp.handlers[name] = lsp.with(handler, win_opts)
		end
	end

	-- Configure diagnostics display
	diagnostic.config({
		virtual_text = true,
		signs = false,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			style = "minimal",
		},
	})

	--  Setup Mason
	require("mason").setup({})
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- Linters
			"eslint_d", -- JavaScript/TypeScript linter
			-- Formatters
			"black", -- Python formatter
			"ruff", -- Python formatter
			"shfmt", -- Shell formatter
			"sqlfmt", -- SQL formatter
			"stylua", -- Lua formatter
			"prettier", -- JavaScript/TypeScript formatter
			"prettierd", --  JavaScript/TypeScript formatter },
		},
		auto_update = true,
	})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls", -- Bash language server
			"cssls", -- CSS language server
			"eslint", -- ESLint
			"graphql", -- GraphQL language server
			"jsonls", -- JSON language server
			"lua_ls", -- Lua language server
			"pyright", -- Python language server
			"ruff", -- Python language server
			"rust_analyzer", -- Rust language server
			"tailwindcss", -- Tailwind CSS language server
			"ts_ls", -- TypeScript language server
			"vimls", -- Vim language server
			"yamlls", -- YAML language server
		},
		automatic_installation = true,
	})

	-- Add cmp_nvim_lsp capabilities to lspconfig
	local lspconfig_defaults = require("lspconfig").util.default_config
	lspconfig_defaults.capabilities =
		tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

	-- Automatically setup servers installed via mason-lspconfig
	require("mason-lspconfig").setup_handlers({
		-- Default handler
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		-- Override handlers for specific servers
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				settings = { Lua = { diagnostics = { globals = { "vim" } }, telemetry = { enable = false } } },
			})
		end,
	})

	-- Setup cmp
	local cmp = require("cmp")
	local max_cmp_items = 5
	cmp.setup({
		-- Set sources
		sources = {
			{ name = "nvim_lsp", max_item_count = max_cmp_items },
			{ name = "buffer", max_item_count = max_cmp_items },
			{ name = "path", max_item_count = max_cmp_items },
		},
		-- Set snippet engine
		snippet = {
			expand = function(args)
				snippet.expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
		-- Enter key will trigger completion
		formatting = {
			format = function(entry, vim_item)
				-- Show source
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]

				-- Limit completion width
				local label = vim_item.abbr
				local truncated_label = vim.fn.strcharpart(label, 0, 50)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. "..."
				end

				return vim_item
			end,
		},
		-- Select first item in list
		preselect = "item",
		completion = { completeopt = "menu,menuone,noinsert" },
		-- UI
		window = {
			completion = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			},
			documentation = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			},
		},
		matching = {
			disallow_fuzzy_matching = false,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = false,
		},
	})
end

return M
