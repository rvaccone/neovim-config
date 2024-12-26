-- Setup localized vim variables
local cmd = vim.cmd
local opt = vim.opt

local M = {}

-- Function to apply vim settings
function M.apply()
	-- General settings
	opt.clipboard = "unnamedplus"
	opt.incsearch = true

	-- Appearance settings
	opt.number = true
	opt.cursorline = true
	opt.ruler = false
	opt.signcolumn = "yes"
	cmd.colorscheme  "gruvbox"

	-- Set indentation settings
	opt.tabstop = 4
	opt.shiftwidth = 4
	opt.expandtab = false
	opt.smartindent = true

	-- Spell check settings
	opt.spelllang = 'en_us'
	opt.spell = true

	-- Formatting settings
	cmd('autocmd BufEnter * set formatoptions-=cro')
end

return M
