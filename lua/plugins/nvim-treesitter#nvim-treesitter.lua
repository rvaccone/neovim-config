return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
	  require("nvim-treesitter.configs").setup {
		  ensure_installed = "all",
		  highlight = {
			  enable = true,
			  use_languagetree = true
		  },
		  indent = { enable = true }
	  }
  end
}
