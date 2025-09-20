-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local loop = vim.loop
local opt = vim.opt
local uv = vim.uv
local v = vim.v

--- Bootstrap lazy.nvim
---@return nil
local function bootstrap_lazy()
	local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (uv or loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			lazyrepo,
			lazypath,
		})

		if v.shell_error ~= 0 then
			api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			fn.getchar()
			os.exit(1)
		end
	end
	opt.rtp:prepend(lazypath)
end

local M = {}

--- Function to aggregate and execute all plugin files from lua/plugins/
---@return nil
function M.aggregate()
	bootstrap_lazy()
	require("lazy").setup({
		checker = { enabled = true },
		ui = {
			size = { width = 0.6, height = 0.8 },
			border = "rounded",
			title = "Lazy.nvim",
			pills = false,
		},
		spec = { { import = "plugins" } },
	})
end

return M
