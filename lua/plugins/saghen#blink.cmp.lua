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

		appearance = {
			-- Kind icons
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "󰒿",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "󰜰",
				Module = "󰏗",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "󰒻",
				Keyword = "󰌋",
				Snippet = "󰩫",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "󰒿",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "󰉁",
				Operator = "󰆕",
				TypeParameter = "󰊄",
			},
		},

		completion = {
			list = {
				max_items = 5,
			},
			menu = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					components = {
						source_name = {
							text = function(ctx)
								local source_names = {
									lsp = "[LSP]",
									buffer = "[Buffer]",
									path = "[Path]",
									snippets = "[Snippet]",
								}
								return source_names[ctx.source_name] or ("[" .. ctx.source_name .. "]")
							end,
						},

						-- Truncate long labels
						label = {
							text = function(ctx)
								local label = ctx.label
								if #label > 50 then
									return label:sub(1, 50) .. "..."
								end
								return label
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
			accept = { auto_brackets = { enabled = true } },
		},

		-- Add signature help
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			},
		},

		-- Sources configuration
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				buffer = {
					max_items = 5,
				},
				lsp = {
					max_items = 5,
				},
				path = {
					max_items = 5,
				},
				snippets = {
					max_items = 5,
				},
			},
		},
	},
}
