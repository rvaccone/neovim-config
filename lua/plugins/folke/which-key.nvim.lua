return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = function(ctx)
			return ctx.plugin and 0 or 1000
		end,
		win = {
			title = false,
		},
	},
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>?", function()
				require("which-key").show({ global = false })
			end, "Buffer local keymaps"),
		}
	end,
}
