-- Setup localized vim variables
local defer_fn = vim.defer_fn

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	config = function()
		---@module "neo-tree"
		---@type neotree.Config?
		require("neo-tree").setup({
			close_if_last_window = true,

			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
			},

			window = {
				width = 30,
			},
		})

		-- Automatically show neo-tree
		defer_fn(function()
			require("neo-tree.command").execute({ action = "show" })
		end, 100)
	end,
}
