-- Setup localized vim variables
local api = vim.api
local treesitter = vim.treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local nvim_treesitter = require("nvim-treesitter")
		nvim_treesitter.setup({})

		-- Add parsers for languages
		nvim_treesitter.install({
			"bash",
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"java",
			"javascript",
			"jsx",
			"json",
			"kotlin",
			"latex",
			"lua",
			"make",
			"markdown",
			"python",
			"r",
			"regex",
			"robots_txt",
			"ruby",
			"rust",
			"scala",
			"sql",
			"tsx",
			"typescript",
			"vue",
			"vim",
			"yaml",
			"zig",
		}, { max_jobs = 10 })

		api.nvim_create_autocmd("FileType", {
			pattern = {
				"bash",
				"c",
				"cpp",
				"css",
				"go",
				"html",
				"java",
				"javascript",
				"javascriptreact", -- jsx parser
				"json",
				"kotlin",
				"tex", -- latex parser
				"lua",
				"make",
				"markdown",
				"python",
				"r",
				"robots_txt",
				"ruby",
				"rust",
				"scala",
				"sql",
				"typescriptreact", -- tsx parser
				"typescript",
				"vue",
				"vim",
				"yaml",
				"zig",
			},
			callback = function()
				treesitter.start()
			end,
		})
	end,
}
