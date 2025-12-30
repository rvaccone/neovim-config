return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>lg", "<cmd>LazyGit<cr>", "Open LazyGit"),
		}
	end,
}
