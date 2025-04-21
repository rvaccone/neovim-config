-- Setup localized vim variables
local fn = vim.fn
local log = vim.log
local loop = vim.loop
local notify = vim.notify

local M = {}

--- Function to aggregate and execute all keymap files from lua/keymaps/
---@return nil
function M.aggregate()
	local keymaps_dir = fn.stdpath("config") .. "/lua/keymaps/"

	-- Scan the keymaps directory once and store results
	local handle, err_scandir = loop.fs_scandir(keymaps_dir)
	if not handle then
		notify("Failed to scan keymaps directory: " .. keymaps_dir .. "\nError: " .. err_scandir, log.levels.ERROR)
		return
	end

	local files = {}
	while true do
		local name, type = loop.fs_scandir_next(handle)
		if not name then
			break
		end
		if type == "file" and name:match("%.lua$") then
			table.insert(files, name)
		end
	end

	-- Execute each keymap file
	for _, name in ipairs(files) do
		local filepath = keymaps_dir .. name
		local success, result = pcall(dofile, filepath)
		if not success then
			notify("Failed to execute keymap file: " .. filepath .. "\nError: " .. result, log.levels.ERROR)
		end
	end
end

return M
