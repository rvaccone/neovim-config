-- Setup localized vim variables
local api = vim.api
local fn = vim.fn
local o = vim.o

local function blame_line_float()
	local line = fn.line(".")
	local file = fn.expand("%:p")
	local out = fn.systemlist({ "git", "blame", "-L", line .. "," .. line, "--", file })

	if vim.v.shell_error ~= 0 then
		vim.notify(table.concat(out, "\n"), vim.log.levels.WARN)
		return
	end

	local buf = api.nvim_create_buf(false, true)
	api.nvim_buf_set_lines(buf, 0, -1, false, out)
	api.nvim_set_option_value("filetype", "git", { buf = buf })
	api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })

	local width = 0
	for _, l in ipairs(out) do
		width = math.max(width, #l)
	end

	local win = api.nvim_open_win(buf, false, {
		relative = "cursor",
		row = 1,
		col = 0,
		width = math.min(width, o.columns - 4),
		height = #out,
		style = "minimal",
		border = "rounded",
	})

	local function close()
		if api.nvim_win_is_valid(win) then
			api.nvim_win_close(win, true)
		end
	end

	for _, key in ipairs({ "q", "<Esc>" }) do
		vim.keymap.set("n", key, close, { buffer = buf, nowait = true, silent = true })
	end

	api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
		once = true,
		callback = close,
	})
end

return {
	"nvim-mini/mini-git",
	name = "mini.git",
	version = false,
	opts = {},
	keys = {
		{ "<leader>gb", blame_line_float, desc = "Git blame line (float)" },
	},
}
