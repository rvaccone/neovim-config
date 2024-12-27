return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			reload_on_bufenter = true, -- Reload the buffer when entering it
			hijack_cursor = true, -- Lock the cursor to the first letter
			filters = {
				dotfiles = false,
				custom = {},
				exclude = {},
			},
			renderer = {
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						none = "  ",
					},
				},
			},
			git = {
				ignore = false,
			},
		})

		-- Auto close functionality
		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
					vim.cmd("quit")
				end
			end,
		})
	end,
}
