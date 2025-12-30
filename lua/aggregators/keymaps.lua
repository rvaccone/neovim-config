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
	local keymaps_dir = fn.stdpath("config") .. "/lua/keymaps"

	local handle = loop.fs_scandir(keymaps_dir)
	if not handle then
		notify("Failed to scan keymaps directory", log.levels.ERROR)
		return
	end

	while true do
		local name, t = loop.fs_scandir_next(handle)
		if not name then
			break
		end

		if t == "file" and name:match("%.lua$") then
			local filepath = keymaps_dir .. "/" .. name
			local ok, err = pcall(cmd.source, filepath)
			if not ok then
				notify("Keymap source failed: " .. filepath .. "\n" .. err, log.levels.ERROR)
			end
		end
	end
end

return M
