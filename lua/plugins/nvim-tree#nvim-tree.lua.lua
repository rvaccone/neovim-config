-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd

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
				},
				full_name = true,
			},
			git = {
				ignore = false,
			},
		})

		-- Auto open functionality
		api.nvim_create_autocmd({ "VimEnter" }, {
			callback = function()
				require("nvim-tree.api").tree.toggle({ focus = false })
			end,
		})

		-- Auto close functionality
		api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if #api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
					cmd("quit")
				end
			end,
		})
	end,
}
