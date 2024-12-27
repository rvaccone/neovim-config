-- Setup localized vim variables
local api = vim.api
local cmd = vim.cmd
local keymap = vim.keymap

local function list_content_windows()
	local windows = api.nvim_list_wins()
	local editor_windows = {}

	for _, window in ipairs(windows) do
		local buf = api.nvim_win_get_buf(window)
		local filetype = api.nvim_buf_get_option(buf, "filetype")
		if filetype ~= "NvimTree" then
			table.insert(editor_windows, window)
		end
	end

	return editor_windows
end

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

	cmd("vsplit")
	cmd("wincmd l")
	cmd("enew")
end

for i = 1, 9 do
	keymap.set("n", "<leader>" .. i, function()
		focus_or_create_window(i)
	end, { desc = "Focus or create window " .. i })
end
