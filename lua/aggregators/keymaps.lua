-- Setup localized vim variables
local cmd = vim.cmd
local fn = vim.fn
local fs = vim.fs
local log = vim.log
local notify = vim.notify

local M = {}

--- Function to aggregate and execute all keymap files from lua/keymaps/
---@return nil
function M.aggregate()
	local keymaps_dir = fn.stdpath("config") .. "/lua/keymaps"

	for name, type in fs.dir(keymaps_dir) do
		if type == "file" and name:match("%.lua$") then
			local filepath = keymaps_dir .. "/" .. name
			local success, result = pcall(cmd.source, filepath)

			if not success then
				notify("Keymap source failed: " .. filepath .. "\n" .. result, log.levels.ERROR)
			end
		end
	end
end

return M
