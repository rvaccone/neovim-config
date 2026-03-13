return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		hide_numbers = true,
		start_in_insert = true,
		persist_mode = false,
	},
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>t", "<cmd>ToggleTerm<cr>", "Toggle terminal"),
			lazy_key("<esc>", [[<C-\><C-n><cmd>close<cr>]], "Close terminal", { mode = "t" }),
		}
	end,
}
