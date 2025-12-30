-- Setup localized vim variables
local cmd = vim.cmd
local fn = vim.fn
local log = vim.log
local loop = vim.loop
local notify = vim.notify

local M = {}

--- Function to aggregate and execute all keymap files from lua/keymaps/
---@return nil
function M.aggregate()
	local base = fn.stdpath("config") .. "/lua/keymaps"

	local function load(dir)
		local h = loop.fs_scandir(dir)
		while h do
			local name, t = loop.fs_scandir_next(h)
			if not name then
				break
			end
			local full = dir .. "/" .. name
			if t == "directory" then
				load(full)
			elseif name:match("%.lua$") then
				local ok, err = pcall(cmd, "source " .. full)
				if not ok then
					notify("Keymap source failed: " .. full .. "\n" .. err, log.levels.ERROR)
				end
			end
		end
	end

	load(base)
end

return M
