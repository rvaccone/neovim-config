-- Setup localized vim variables
local defer_fn = vim.defer_fn
local fn = vim.fn
local log = vim.log
local notify = vim.notify

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	config = function()
		---@module "neo-tree"
		---@type neotree.Config?
		require("neo-tree").setup({
			close_if_last_window = true,

			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
			},

			window = {
				width = 30,

				mappings = {
					-- Custom filename copying
					["Y"] = function(state)
						local node = state.tree:get_node()
						if node then
							local filename = node.name
							fn.setreg("+", filename)
							notify("Copied filename: " .. filename, log.levels.INFO)
						end
					end,
				},
			},
		})

		-- Automatically show neo-tree
		defer_fn(function()
			require("neo-tree.command").execute({ action = "show" })
		end, 100)
	end,
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>nt", "<cmd>Neotree toggle<cr>", "Toggle Neo-tree"),
			lazy_key("<leader>0", "<cmd>Neotree focus<cr>", "Focus Neo-tree"),
		}
	end,
}
