return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,

	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false,

		keymaps = {
			["q"] = { "actions.close", mode = "n" },
			["<esc>"] = { "actions.close", mode = "n" },
		},

		win_options = {
			wrap = true,
			spell = true,
		},

		view_options = {
			show_hidden = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
	},
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>-", "<cmd>Oil --float<cr>", "Open Oil at the current file", {
				mode = { "n", "v" },
			}),
		}
	end,
}
