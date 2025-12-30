return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			preset = "modern",
			delay = function(ctx)
				return ctx.plugin and 0 or 1000
			end,
			win = {
				title = false,
			},
		})
	end,
}
