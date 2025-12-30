return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		open_cmd = "botright vnew",
	},
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>sp", require("spectre").toggle, "Toggle Spectre (project-wide search/replace)"),
		}
	end,
}
