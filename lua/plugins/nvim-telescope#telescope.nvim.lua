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
				file_ignore_patterns = {
					"node_modules/.*",
					".git/.*",
					"%.lock",
					"%.svg",
					"%.png",
					"%.jpg",
					"%.jpeg",
					"%.webp",
					"%.gif",
					"%.mp4",
					"%.pdf",
					"%.ttf",
					"%.otf",
					"%.DS_Store",
				},
				-- Layout
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						height = 0.5,
					},
				},
				path_display = { "truncate" },
				mappings = {
					i = { ["<esc>"] = require("telescope.actions").close }, -- Immediately close Telescope
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
				},
				live_grep = {
					hidden = true,
					additional_args = function()
						return { "--hidden" }
					end,
				},
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
			},
			extensions = {
				fzf = {},
			},
		})

		-- Load fzf extension
		require("telescope").load_extension("fzf")
	end,
}
