-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap
local log = vim.log
local notify = vim.notify
local tbl_contains = vim.tbl_contains

---@class Config
---@field max_windows number Maximum number of windows to support @field excluded_filetypes string[] List of filetypes to exclude from window creation
local config = {
	max_windows = 9,
	excluded_filetypes = { "help", "NvimTree" },
}

--- Returns a list of all editor windows
---@return table
local function list_content_windows()
	local windows = api.nvim_list_wins()
	local editor_windows = {}

	for _, window in ipairs(windows) do
		local buf = api.nvim_win_get_buf(window)

		if buf and buf > 0 then
			local filetype = api.nvim_buf_get_option(buf, "filetype")
			local buftype = api.nvim_buf_get_option(buf, "buftype")

			if not tbl_contains(config.excluded_filetypes, filetype) and buftype ~= "help" then
				table.insert(editor_windows, window)
			end
		end
	end

	return editor_windows
end

--- Focuses or creates a window at the end of the editor window list
---@param window_number number The window number to focus or create (1-based indexed)
---@param split_direction "vsplit"|"split" The split direction to use when creating a new window
---@return nil
local function focus_or_create_window(window_number, split_direction)
	local editor_windows = list_content_windows()

	-- If the requested window exists, focus it
	if window_number <= #editor_windows then
		api.nvim_set_current_win(editor_windows[window_number])
		return
	end

	-- Otherwise, create a new window
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

--- Executes a command on a window
---@param window_number number The window number to operate on
---@param operation string The command to execute on the window
---@return nil
local function operate_on_window(window_number, operation)
	local editor_windows = list_content_windows()

	if window_number <= #editor_windows then
		api.nvim_set_current_win(editor_windows[window_number])

		local success, result = pcall(cmd, operation)
		if not success then
			notify("Error operating on window: " .. result, log.levels.ERROR)
		end
	end
end

-- Setup keymaps for window navigation
for index = 1, config.max_windows do
	-- Focusing or creating horizontal windows
	keymap.set("n", "<leader>" .. index, function()
		focus_or_create_window(index, "vsplit")
	end, { desc = "Focus or create window " .. index, silent = true })

	-- Focusing or creating vertical windows
	keymap.set("n", "<leader>v" .. index, function()
		focus_or_create_window(index, "split")
	end, { desc = "Focus or create window " .. index, silent = true })

	-- Closing windows without saving
	keymap.set("n", "<leader>q" .. index, function()
		operate_on_window(index, "q!")
	end, { desc = "Close window " .. index .. " without saving", silent = true })

	-- Closing windows with saving
	keymap.set("n", "<leader>z" .. index, function()
		operate_on_window(index, "wq")
	end, { desc = "Close window " .. index .. " with saving", silent = true })
end
