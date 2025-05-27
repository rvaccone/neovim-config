-- Setup localized vim variables
local bo = vim.bo

return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",

			-- Navigation
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			-- Confirmation
			["<CR>"] = { "accept", "fallback" },
			["<S-CR>"] = { "cancel", "fallback" },
		},

		-- Prevent blink from showing on NvimTree
		enabled = function()
			return bo.buftype ~= "nofile"
		end,

		completion = {
			list = { max_items = 5 },

			menu = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					treesitter = { "lsp" },
					components = {
						source_name = {
							text = function(ctx)
								local source_names = {
									lsp = "[LSP]",
									buffer = "[Buffer]",
									path = "[Path]",
									snippets = "[Snippet]",
									cmdline = "[Cmd]",
								}
								return source_names[ctx.source_name] or ("[" .. ctx.source_name .. "]")
							end,
						},
					},
				},
			},

			documentation = {
				window = {
					border = "rounded",
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},

		-- Cmdline configuration
		cmdline = {
			keymap = {
				preset = "none",

				-- Navigation
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				-- Confirmation
				["<Tab>"] = { "show", "accept" },
			},
			completion = { menu = { auto_show = true } },
		},

		-- Sources configuration
		sources = {
			providers = {
				lsp = { max_items = 5 },
				buffer = { max_items = 5 },
				path = { max_items = 5 },
				snippets = { max_items = 5 },
			},
		},

		-- Fuzzy configuration
		fuzzy = {
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},
	},
}
