return {
	"echasnovski/mini.jump2d",
	version = "*",
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
			-- Remove default mappings to keep them in the keymaps folder
			mappings = {
				start_jumping = "",
			},
			silent = true,
		})
	end,
}
