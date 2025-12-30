-- Setup localized vim variables
local fn = vim.fn

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
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- Prefixes and appearance
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				color_devicons = true,
				results_title = false,

				-- Performance
				cache_picker = {
					num_pickers = -1,
					limit_entries = 1000,
				},

				-- Sorting
				file_ignore_patterns = {
					-- Folders
					"^.git/",
					"%.DS_Store",
					"%.lock",
					"^node_modules/",

					-- Fonts
					"%.ttf",
					"%.otf",

					-- Images
					"%.svg",
					"%.png",
					"%.jpg",
					"%.jpeg",
					"%.webp",
					"%.gif",

					-- Videos
					"%.mp4",
					"%.mkv",
					"%.mov",

					-- Documents
					"%.pdf",
					"%.doc",
				},

				-- Layout
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						height = 0.6,
						width = 0.9,
						preview_width = 0.6,
					},
				},
				path_display = { "truncate", truncate = 3 },
				mappings = {
					i = {
						["<esc>"] = actions.close, -- Immediately close Telescope
						["<c-u>"] = false, -- Clear the query

						-- Preview
						["<c-f>"] = actions.preview_scrolling_down,
						["<c-d>"] = actions.preview_scrolling_up,
					},
					n = {
						["q"] = actions.close,
						["<c-u>"] = false,
					},
				},
			},
			pickers = {
				buffers = {
					preview_title = false,
					show_all_buffers = true,
					sort_lastused = true,
					initial_mode = "normal",
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
						n = {
							["<c-d>"] = actions.delete_buffer,
							["d"] = actions.delete_buffer,
						},
					},
				},

				current_buffer_fuzzy_find = {
					preview_title = false,
				},

				diagnostics = {
					preview_title = false,
				},

				find_files = {
					preview_title = false,
					hidden = true,
					follow = true,
					find_command = fn.executable("fd") == 1 and {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--follow",
						"--strip-cwd-prefix",
					} or nil, -- Falls back to Telescope's default
				},

				grep_string = {
					preview_title = false,
				},

				live_grep = {
					preview_title = false,
					hidden = true,
					additional_args = function()
						return { "--hidden" }
					end,
				},

				marks = {
					preview_title = false,
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
		telescope.load_extension("fzf")
	end,
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>ff", require("telescope.builtin").find_files, "Find files"),
			lazy_key("<leader>fg", require("telescope.builtin").live_grep, "Find with grep"),
			lazy_key("<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, "Find in file"),
			lazy_key("<leader>fw", require("telescope.builtin").grep_string, "Find word"),
			lazy_key("<leader>fb", require("telescope.builtin").buffers, "Find buffer"),
			lazy_key("<leader>fd", require("telescope.builtin").diagnostics, "Find diagnostic"),
			lazy_key("<leader>fm", require("telescope.builtin").marks, "Search marks"),
			lazy_key("<leader>fr", require("telescope.builtin").resume, "Resume last picker"),
		}
	end,
}
