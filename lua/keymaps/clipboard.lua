-- Import required modules
local map = require("utils.keymap").map

map("yr", '"_diwP', "Replace word from clipboard")
map("yR", '"_diWP', "Replace WORD from clipboard")

map("<leader>ya", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local path = vim.fn.expand("%:.")
	if path == "" then
		path = "[No Name]"
	end
	vim.fn.setreg("+", string.format("%s:\n%s", path, table.concat(lines, "\n")))
	local line_word = #lines == 1 and "line" or "lines"
	vim.notify(string.format("Copied %d %s to clipboard with path", #lines, line_word))
end, "Yank buffer with path", { mode = { "n", "v" } })
