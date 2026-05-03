return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false,

		float = {
			border = "rounded",
		},

		keymaps = {
			["q"] = { "actions.close", mode = "n" },
			["<esc>"] = { "actions.close", mode = "n" },
		},

		view_options = {
			show_hidden = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},

		watch_for_changes = true,

		win_options = {
			wrap = true,
			spell = true,
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
