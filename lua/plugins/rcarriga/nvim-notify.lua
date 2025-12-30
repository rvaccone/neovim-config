return {
	"rcarriga/nvim-notify",
	lazy = false,
	priority = 1000,
	config = function()
		local nvim_notify = require("notify")
		nvim_notify.setup({
			fps = 60,
			background_colour = "#000000",
			render = "wrapped-compact",
			stages = "fade",
			timeout = 1750,
			top_down = false,
		})
		vim.notify = nvim_notify
	end,
}
