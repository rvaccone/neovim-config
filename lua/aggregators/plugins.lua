-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local fs = vim.fs
local opt = vim.opt
local uv = vim.uv
local v = vim.v

--- Bootstrap lazy.nvim
---@return nil
local function bootstrap_lazy()
	local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not uv.fs_stat(lazypath) then
		local out = fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--branch=stable",
			"https://github.com/folke/lazy.nvim.git",
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

-- Load plugin specifications
local spec = {}
local plugins_dir = fn.stdpath("config") .. "/lua/plugins"
for name, type in fs.dir(plugins_dir) do
	if type == "directory" then
		table.insert(spec, { import = "plugins." .. name })
	end
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
		spec = spec,
	})
end

return M
