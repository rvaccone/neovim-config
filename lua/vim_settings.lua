-- Setup localized vim variables
local cmd = vim.cmd
local opt = vim.opt

local M = {}

-- Function to apply vim settings
---@return nil
function M.apply()
	-- General settings
	opt.clipboard = "unnamedplus" -- Use the system clipboard
	opt.incsearch = true -- Show search results as you type

	-- Appearance settings
	opt.number = true -- Show line numbers
	opt.cursorline = true -- Highlight the current line
	opt.ruler = false -- Hide the ruler
	opt.signcolumn = "yes" -- Always show the sign column
	opt.scrolloff = 10 -- Keep eight lines above and below the cursor if possible
	opt.termguicolors = true -- Use the terminal colors
	cmd.colorscheme("gruvbox") -- Set the colorscheme

	-- Text wrapping settings
	opt.wrap = true -- Wrap lines
	opt.linebreak = true -- Wrap at word boundaries
	opt.breakindent = true -- Wrapped lines preserve indentation

	-- Set indentation settings
	opt.tabstop = 4 -- Set the tab width to 4 spaces
	opt.shiftwidth = 4 -- Size of an indentation step
	opt.expandtab = false -- Do not convert tabs to spaces
	opt.smartindent = true -- Insert indents automatically

	-- Spell check settings
	opt.spelllang = "en_us" -- Set the spell language to English
	opt.spell = true -- Enable spell checking

	-- Formatting settings
	cmd("autocmd BufEnter * set formatoptions-=cro") -- Disable comment auto-wrapping
end

return M
