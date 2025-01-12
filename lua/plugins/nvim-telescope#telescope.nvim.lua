return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", -- Requires make to be installed
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				-- Prefixes and appearance
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				color_devicons = true,
				results_title = false,
				-- Sorting
				file_ignore_patterns = { "node_modules/.*", ".git/.*", "%.lock" },
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
					no_ignore = true,
					follow = true,
				},
				live_grep = {
					hidden = true,
					no_ignore = true,
					additional_args = function()
						return { "--hidden" }
					end,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Load fzf extension
		require("telescope").load_extension("fzf")
	end,
}
