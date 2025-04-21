-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local keymap = vim.keymap
local log = vim.log
local notify = vim.notify

--- Function to yank the entire buffer and append the file path
---@return nil
local function yank_with_path()
	-- Get the buffer content and the paths
	local buffer_content = api.nvim_buf_get_lines(0, 0, -1, false)
	local full_file_path = fn.expand("%:p")
	local current_dir = fn.getcwd()

	-- Get the relative file path from the current directory
	local relative_file_path = full_file_path:gsub(current_dir .. "/", "")

	-- Yank the combined content to the clipboard
	local combined_content = string.format("%s:\n%s", relative_file_path, table.concat(buffer_content, "\n"))
	fn.setreg("+", combined_content)

	-- Notify the user
	notify(string.format("Copied %d lines to clipboard with path", #buffer_content))
end

keymap.set("n", "<leader>ya", yank_with_path, { desc = "Yank buffer content and file path to clipboard" })

keymap.set("n", "<leader>yn", function()
	local filename = fn.expand("%:t")
	if filename and filename ~= "" then
		fn.setreg("+", filename)
		notify(string.format("Copied filename %s to clipboard", filename))
	else
		notify("No filename found", log.levels.ERROR)
	end
end, { desc = "Yank filename to clipboard" })
