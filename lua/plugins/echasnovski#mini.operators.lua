return {
	"echasnovski/mini.operators",
	version = "*",
	config = function()
		require("mini.operators").setup({
			-- Evaluate text and replace with output
			evaluate = {
				prefix = "", -- Will be defined in the corresponding keymap file
			},

			-- Exchange text regions
			exchange = {
				prefix = "",
			},

			-- Multiply (duplicate) text
			multiply = {
				prefix = "",
			},

			-- Replace text with register
			replace = {
				prefix = "",
			},

			-- Sort text
			sort = {
				prefix = "",
			},
		})
	end,
}
