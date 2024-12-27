-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap
local tbl_contains = vim.tbl_contains

---@class Config
---@field max_windows number Maximum number of windows to support
---@field excluded_filetypes string[] List of filetypes to exclude from window creation
---@field split_direction "vsplit"|"split" Split direction to use when creating new windows
local config = {
	max_windows = 9,
	excluded_filetypes = { "NvimTree" },
	split_direction = "vsplit",
}

---@return table
local function list_content_windows()
	local windows = api.nvim_list_wins()
	local editor_windows = {}

	for _, window in ipairs(windows) do
		local buf = api.nvim_win_get_buf(window)
		local filetype = api.nvim_buf_get_option(buf, "filetype")
		if not tbl_contains(config.excluded_filetypes, filetype) then
			table.insert(editor_windows, window)
		end
	end

	return editor_windows
end

---@param window_number number The window number to focus or create (1-based indexed)
---@return nil
local function focus_or_create_window(window_number)
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

	cmd(config.split_direction)
	cmd("wincmd l")
	cmd("enew")
end

-- Setup keymaps for window navigation
for i = 1, config.max_windows do
	keymap.set("n", "<leader>" .. i, function()
		focus_or_create_window(i)
	end, { desc = "Focus or create window " .. i, silent = true })
end
