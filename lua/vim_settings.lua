-- Setup localized vim variables
local cmd = vim.cmd
local opt = vim.opt

local M = {}

--- Function to apply vim settings
---@return nil
function M.apply()
	-- General
	opt.clipboard = "unnamedplus" -- Use the system clipboard
	opt.smoothscroll = true -- Enable smooth scrolling
	opt.updatetime = 250 -- Milliseconds between swaps while typing
	opt.timeoutlen = 250 -- Milliseconds to wait for a mapped sequence to complete

	-- Search
	opt.incsearch = true -- Show search results as you type
	opt.ignorecase = true -- Ignore case when searching
	opt.smartcase = true -- Override ignorecase when pattern contains uppercase characters

	-- Layout
	opt.ruler = false -- Hide the ruler
	opt.showmode = false -- Hide the mode indicator
	opt.number = true -- Show line numbers
	opt.signcolumn = "yes" -- Always show the sign column

	-- Appearance
	opt.cursorline = true -- Highlight the current line
	opt.scrolloff = 12 -- Keep twelve lines above and below the cursor if possible
	opt.termguicolors = true -- Use the terminal colors
	opt.winborder = "rounded" -- Use rounded borders for floating windows
	cmd.colorscheme("gruvbox") -- Set the colorscheme

	-- Text wrapping
	opt.wrap = true -- Wrap lines
	opt.linebreak = true -- Wrap at word boundaries
	opt.breakindent = true -- Wrapped lines preserve indentation
	opt.showbreak = "↳" -- Show a character for wrapped lines

	-- Set indentation
	opt.expandtab = false -- Do not convert tabs to spaces
	opt.tabstop = 4 -- Set the tab width to 4 spaces
	opt.shiftwidth = 4 -- Size of an indentation step
	opt.smartindent = true -- Insert indents automatically
	opt.shiftround = true -- Round indent to a multiple of shiftwidth

	-- File handling
	opt.undofile = true -- Enable persistent undo
	opt.swapfile = false -- Do not create a swapfile

	-- Spell check
	opt.spell = true -- Enable spell checking
	opt.spelllang = "en_us" -- Set the spell language to English
	opt.spelloptions = "camel" -- Treat camelCase as separate words for spell checking

	-- Formatting
	cmd("autocmd BufEnter * set formatoptions-=cro") -- Disable comment auto-wrapping
end

return M
