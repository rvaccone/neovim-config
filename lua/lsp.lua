-- Setup localized vim variables
local fn = vim.fn
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local snippet = vim.snippet

local M = {}

--- Function to setup LSP
---@return nil
function M.setup()
	-- Configure LSP window borders
	local win_opts = { border = "rounded" }
	for name, handler in pairs(lsp.handlers) do
		if type(handler) == "function" then
			lsp.handlers[name] = lsp.with(handler, win_opts)
		end
	end

	-- Override open_floating_preview to use borders
	local original_open_floating_preview = lsp.util.open_floating_preview
	lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return original_open_floating_preview(contents, syntax, opts, ...)
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
			header = "",
			prefix = "",
		},
	})

	-- Setup completion with cmp
	local cmp = require("cmp")
	local max_cmp_items = 5

	-- Kind icons for menu display
	local kind_icons = {
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
	}

	cmp.setup({
		-- Set sources
		sources = {
			{ name = "nvim_lsp", max_item_count = max_cmp_items, priority = 100 },
			{ name = "buffer", max_item_count = max_cmp_items, priority = 50 },
			{ name = "calc", max_item_count = max_cmp_items, priority = 40 },
			{ name = "path", max_item_count = max_cmp_items, priority = 25 },
		},

		-- Set snippet engine
		snippet = {
			expand = function(args)
				snippet.expand(args.body)
			end,
		},

		-- Set keymaps
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),

		-- Set formatting
		formatting = {
			format = function(entry, vim_item)
				-- Add icons
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)

				-- Add source indicators
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					calc = "[Calc]",
					path = "[Path]",
					cmdline = "[Cmdline]",
				})[entry.source.name] or entry.source.name

				-- Truncate long completion items
				local label = vim_item.abbr
				local truncated_label = fn.strcharpart(label, 0, 50)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. "..."
				end

				return vim_item
			end,
		},

		-- UI behavior
		preselect = "item",
		completion = { completeopt = "menu,menuone,noinsert" },

		-- Window appearance
		window = {
			completion = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
				side_padding = 1,
				col_offset = -1,
			},
			documentation = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:Normal",
				side_padding = 1,
				col_offset = -1,
			},
		},

		-- Matching behavior
		matching = {
			disallow_fuzzy_matching = false,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = false,
		},
	})

	-- Add completion for search mode
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline({
			["<C-n>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					cmp.complete()
				end
			end, { "c" }),

			["<C-p>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					cmp.complete()
				end
			end, { "c" }),

			["<Tab>"] = cmp.mapping(function(_)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					cmp.complete()
				end
			end, { "c" }),
		}),
		sources = {
			{ name = "buffer", max_item_count = max_cmp_items, priority = 100 },
		},
	})

	-- Add completion for command-line mode
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline({
			["<C-n>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					cmp.complete()
				end
			end, { "c" }),

			["<C-p>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					cmp.complete()
				end
			end, { "c" }),

			["<Tab>"] = cmp.mapping(function(_)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					cmp.complete()
				end
			end, { "c" }),
		}),
		sources = cmp.config.sources({
			{ name = "cmdline", max_item_count = max_cmp_items, priority = 100 },
			{ name = "path", max_item_count = max_cmp_items, priority = 50 },
		}),
	})
end

return M
