return {
	"rcarriga/nvim-notify",
	lazy = false,
	priority = 1000,
	opts = {
		fps = 60,
		background_colour = "#000000",
		render = "wrapped-compact",
		stages = "fade",
		timeout = 1750,
		top_down = false,
	},
	config = function(_, opts)
		local nvim_notify = require("notify")
		nvim_notify.setup(opts)
		vim.notify = nvim_notify
	end,
}
