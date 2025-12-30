return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	opts = {
		max_concurrent_installers = 10,
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>lm", "<cmd>Mason<cr>", "Open Mason"),
		}
	end,
}
