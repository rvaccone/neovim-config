return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {},
			lualine_b = {
				{
					"filename",

					path = 1,
					symbols = { modified = " ●", readonly = " ", unnamed = "[Unnamed]" },
					separator = { right = "" },
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					separator = { left = "" },
				},
			},
			lualine_z = {},
		},
	},
}
