return {
	"neanias/everforest-nvim",
	priority = 1000,
	version = false,
	config = function()
		require("everforest").setup({
			background = "hard",
			transparent_background_level = 1,
		})
	end,
}
