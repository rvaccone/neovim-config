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
			},

			window = {
				width = 30,
			},
		})

		-- Automatically show neo-tree
		require("neo-tree.command").execute({ action = "show" })
	end,
}
