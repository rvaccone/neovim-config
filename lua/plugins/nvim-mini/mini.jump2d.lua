return {
	"nvim-mini/mini.jump2d",
	version = false,
	config = function()
		require("mini.jump2d").setup({
			spotter = require("mini.jump2d").builtin_opts.word_start.spotter,
			labels = "abcdefghijklmnopqrstuvwxyz;",
			view = {
				dim = true,
				n_steps_ahead = 1,
			},
			allowed_lines = {
				blank = false,
				cursor_at = false,
			},
			allowed_windows = {
				not_current = false,
			},
			silent = true,
		})
	end,
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<CR>", function()
				require("mini.jump2d").start()
			end, "Quick jump in current window"),

			lazy_key("<del>", function()
				require("mini.jump2d").start({
					allowed_windows = {
						not_current = true,
					},
				})
			end, "Quick jump across windows"),
		}
	end,
}
