---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/snacks.nvim",
	},

	---@type YaziConfig | {}
	opts = {
		keymaps = false,
	},
}
