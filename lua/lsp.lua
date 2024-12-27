-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap
local snippet = vim.snippet
local tbl_deep_extend = vim.tbl_deep_extend

local M = {}

---@return nil
function M.setup()
	-- Configure diagnostics display
	vim.diagnostic.config({
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
		},
	})

	--  Setup Mason
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls", -- Bash language server
			"cssls", -- CSS language server
			"eslint", -- ESLint
			"graphql", -- GraphQL language server
			"jsonls", -- JSON language server
			"lua_ls", -- Lua language server
			"pyright", -- Python language server
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

	-- Add LSP keymaps
	api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function(event)
			local opts = { buffer = event.buf }

			-- Show hover documentation
			opts.desc = "Show hover documentation"
			keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

			-- Go to definition
			opts.desc = "Go to definition"
			keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

			-- Go to declaration
			opts.desc = "Go to declaration"
			keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

			-- Go to implementation
			opts.desc = "Go to implementation"
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

			-- Go to type definition
			opts.desc = "Go to type definition"
			keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

			-- Show references
			opts.desc = "Show references"
			keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

			-- Show signature help
			opts.desc = "Show signature help"
			keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

			-- Rename symbol
			opts.desc = "Rename symbol"
			keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

			-- Format code
			opts.desc = "Format code"
			keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

			-- Show code actions
			opts.desc = "Show code actions"
			keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		end,
	})

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
		-- Enter key will trigger completion
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
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
	})
end

return M
