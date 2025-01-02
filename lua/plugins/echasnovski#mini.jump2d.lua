return {
	"echasnovski/mini.jump2d",
	version = "*",
	config = function()
		require("mini.jump2d").setup({
			n_steps_ahead = 1,
		})
	end,
}
