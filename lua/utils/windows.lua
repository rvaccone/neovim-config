-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local log = vim.log
local notify = vim.notify
local tbl_contains = vim.tbl_contains

local M = {}

---@class WindowsConfig
---@field excluded_filetypes string[] List of filetypes to exclude from window creation
---@field max_windows number Maximum number of windows to support
M.windows_config = {
	excluded_filetypes = { "help", "neo-tree" },
	max_windows = 9,
}

--- Returns a list of all editor windows
---@return table
function M.list_content_windows()
	local windows = api.nvim_list_wins()
	local editor_windows = {}

	for _, window in ipairs(windows) do
		local buf = api.nvim_win_get_buf(window)

		if buf and buf > 0 then
			local filetype = api.nvim_get_option_value("filetype", { buf = buf })
			local buftype = api.nvim_get_option_value("buftype", { buf = buf })

			if not tbl_contains(M.windows_config.excluded_filetypes, filetype) and buftype ~= "help" then
				table.insert(editor_windows, window)
			end
		end
	end

	return editor_windows
end

--- Focuses or creates a window at the end of the editor window list
---@param split_direction "vsplit"|"split" The split direction to use when creating a new window
---@return nil
function M.create_window(split_direction)
	local editor_windows = M.list_content_windows()

	-- Prevent creating a new window if the maximum number of windows has been reached
	if #editor_windows >= M.windows_config.max_windows then
		notify("Maximum number of windows reached", log.levels.WARN)
		return
	end

	if #editor_windows > 0 then
		api.nvim_set_current_win(editor_windows[#editor_windows])
	end

	cmd(split_direction)
	if split_direction == "vsplit" then
		cmd("wincmd l")
	else
		cmd("wincmd j")
	end
	cmd("enew")
end

--- Focuses or creates a window at the end of the editor window list
---@param window_number number The window number to focus or create (1-based indexed)
---@param split_direction "vsplit"|"split" The split direction to use when creating a new window
---@return nil
function M.focus_or_create_window(window_number, split_direction)
	local editor_windows = M.list_content_windows()

	-- If the requested window exists, focus it
	if window_number <= #editor_windows then
		api.nvim_set_current_win(editor_windows[window_number])
		return
	end

	-- Otherwise, create a new window
	M.create_window(split_direction)
end

--- Executes a command on a window
---@param window_number number The window number to operate on
---@param operation string The command to execute on the window
---@return nil
function M.operate_on_window(window_number, operation)
	local editor_windows = M.list_content_windows()

	if window_number <= #editor_windows then
		api.nvim_set_current_win(editor_windows[window_number])

		local success, result = pcall(cmd, operation)
		if not success then
			notify("Error operating on window: " .. result, log.levels.ERROR)
		end
	end
end

return M
