-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local log = vim.log
local notify = vim.notify
local pesc = vim.pesc

-- Windows utilities
local windows = require("utils.windows")

--- Return OS path separator
---@return string
local function path_sep()
	return package.config:sub(1, 1)
end

--- Get a relative file path from a directory
---@param abs_path string
---@param cwd string|nil
---@return string
local function relativize_path(abs_path, cwd)
	-- Handle empty or no absolute path
	if not abs_path or abs_path == "" then
		return "[No Name]"
	end

	-- Determine the prefix for the current directory
	local base = cwd or fn.getcwd()
	local sep = path_sep()
	local prefix = base .. sep

	-- Strip the prefix from the absolute path
	local stripped = abs_path:gsub("^" .. pesc(prefix), "")
	return stripped ~= abs_path and stripped or abs_path
end

--- Compose buffer content with its relative file path
---@param cwd string|nil
---@param buf integer|nil
---@return string
local function compose_buffer_content_with_path(cwd, buf)
	buf = buf or 0
	local buffer_content = api.nvim_buf_get_lines(buf, 0, -1, false)
	local abs_path = api.nvim_buf_get_name(buf)
	local display_path = relativize_path(abs_path, cwd)
	return string.format("%s:\n%s", display_path, table.concat(buffer_content, "\n"))
end

--- Yank the entire buffer and append the file path
local function yank_with_path()
	local combined_content = compose_buffer_content_with_path(nil, 0)
	fn.setreg("+", combined_content)

	-- Notify the user
	notify(string.format("Copied %d lines to clipboard with path", api.nvim_buf_line_count(0)))
end

--- Compose an AI-friendly block for a given window
---@param win integer|nil
---@param cwd string|nil
---@return string
local function compose_block_for_window(win, cwd)
	-- Get the buffer content and the path
	local target_win = win or api.nvim_get_current_win()
	local buf = api.nvim_win_get_buf(target_win)
	local lines_tbl = api.nvim_buf_get_lines(buf, 0, -1, false)
	local abs_path = api.nvim_buf_get_name(buf)
	local relpath = relativize_path(abs_path, cwd)
	local filetype = api.nvim_get_option_value("filetype", { buf = buf }) or ""

	-- Compose the block
	return table.concat({
		"=== FILE BEGIN ===",
		"Path: " .. relpath,
		"Filetype: " .. filetype,
		"Lines: " .. tostring(#lines_tbl),
		"--- CONTENT ---",
		table.concat(lines_tbl, "\n"),
		"=== FILE END ===",
	}, "\n")
end

--- Yank buffer contents and file paths for all open windows
local function yank_all_with_path()
	local editor_windows = windows.list_content_windows()

	-- Prevent yanking if there are no windows
	if #editor_windows == 0 then
		notify("No content windows to yank", log.levels.WARN)
		return
	end

	local original_win = api.nvim_get_current_win()
	local cwd = fn.getcwd()
	local blocks = {}
	local total_lines = 0

	-- Iterate in window index order and compose blocks
	for i = 1, #editor_windows do
		local win = editor_windows[i]
		if api.nvim_win_is_valid(win) then
			table.insert(blocks, compose_block_for_window(win, cwd))
			total_lines = total_lines + api.nvim_buf_line_count(api.nvim_win_get_buf(win))
		end
	end

	-- Restore original window focus
	if original_win and api.nvim_win_is_valid(original_win) then
		api.nvim_set_current_win(original_win)
	end

	-- Notify the user
	fn.setreg("+", table.concat(blocks, "\n"))
	notify(string.format("Copied %d windows with %d total lines to clipboard with paths", #blocks, total_lines))
end

keymap.set(
	"n",
	"<leader>ya",
	yank_with_path,
	{ desc = "Yank buffer content and file path to clipboard", noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>yA",
	yank_all_with_path,
	{ desc = "Yank buffer contents and file paths for all open windows", noremap = true, silent = true }
)

keymap.set("n", "<leader>yn", function()
	local filename = fn.expand("%:t")
	if filename and filename ~= "" then
		fn.setreg("+", filename)
		notify(string.format("Copied filename %s to clipboard", filename))
	else
		notify("No filename found", log.levels.ERROR)
	end
end, { desc = "Yank filename to clipboard", noremap = true, silent = true })
