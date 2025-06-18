return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },
			modules = {},
		})
	end,
}
