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
}
