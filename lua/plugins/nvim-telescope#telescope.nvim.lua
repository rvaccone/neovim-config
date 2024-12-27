return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("telescope").setup({
			defaults = {
				-- Prefixes
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				-- Appearance
				color_devicons = true,
				results_title = false,
				-- Sorting
				file_ignore_patterns = { "node_modules", ".git" },
				-- Layout
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						height = 0.5,
					},
				},
				mappings = {
					-- i = { ["<esc>"] = require("telescope.actions").close }, -- Immediately close Telescope
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					hidden = true,
				},
			},
		})
	end,
}
