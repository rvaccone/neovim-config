-- Setup localized vim variables
local api = vim.api
local buf = vim.lsp.buf
local keymap = vim.keymap

-- Telescope builtin
local telescope_builtin = require("telescope.builtin")

-- Create autocmd group
local group = api.nvim_create_augroup("LSPConfig", { clear = true })

-- Local modules
local windows = require("utils.windows")

--- Opens a LSP location in a new window
---@param method "declaration"|"definition"|"type_definition" The LSP method to use
---@param split_direction "vsplit"|"split" The split direction to use when creating a new window
---@return nil
local function open_lsp_location_in_new_window(method, split_direction)
	local current_buf = vim.api.nvim_get_current_buf()
	local current_windows = #windows.list_content_windows()
	windows.focus_or_create_window(current_windows + 1, split_direction)
	vim.api.nvim_win_set_buf(0, current_buf)

	if method == "declaration" then
		buf.declaration()
	elseif method == "definition" then
		buf.definition()
	elseif method == "type_definition" then
		buf.type_definition()
	else
		vim.notify("Unsupported LSP method: " .. tostring(method), vim.log.levels.ERROR)
	end
end

-- Setup LSP keymaps when LSP attaches to a buffer
api.nvim_create_autocmd("LspAttach", {
	group = group,
	desc = "LSP actions",

	---@param event table
	---@return nil
	callback = function(event)
		-- Definition
		keymap.set(
			"n",
			"gd",
			buf.definition,
			{ desc = "Go to definition", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set("n", "<leader>gd", function()
			open_lsp_location_in_new_window("definition", "vsplit")
		end, {
			desc = "Go to definition in a new window",
			buffer = event.buf,
			noremap = true,
			silent = true,
		})
		keymap.set("n", "<leader>vgd", function()
			open_lsp_location_in_new_window("definition", "split")
		end, { desc = "Go to definition in a new vertical window", buffer = event.buf, noremap = true, silent = true })

		-- Declaration
		keymap.set(
			"n",
			"gD",
			buf.declaration,
			{ desc = "Go to declaration", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set("n", "<leader>gD", function()
			open_lsp_location_in_new_window("declaration", "vsplit")
		end, { desc = "Go to declaration in a new window", buffer = event.buf, noremap = true, silent = true })
		keymap.set("n", "<leader>vgD", function()
			open_lsp_location_in_new_window("declaration", "split")
		end, { desc = "Go to declaration in a new vertical window", buffer = event.buf, noremap = true, silent = true })

		-- Implementation
		keymap.set(
			"n",
			"gi",
			telescope_builtin.lsp_implementations,
			{ desc = "Go to implementation", buffer = event.buf, noremap = true, silent = true }
		)

		-- Type Definition
		keymap.set(
			"n",
			"gt",
			buf.type_definition,
			{ desc = "Go to type definition", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set("n", "<leader>gt", function()
			open_lsp_location_in_new_window("type_definition", "vsplit")
		end, { desc = "Go to type definition in a new window", buffer = event.buf, noremap = true, silent = true })
		keymap.set("n", "<leader>vgt", function()
			open_lsp_location_in_new_window("type_definition", "split")
		end, {
			desc = "Go to type definition in a new vertical window",
			buffer = event.buf,
			noremap = true,
			silent = true,
		})

		-- References
		keymap.set(
			"n",
			"gr",
			telescope_builtin.lsp_references,
			{ desc = "Show references", buffer = event.buf, noremap = true, silent = true }
		)

		-- Documentation
		keymap.set(
			"n",
			"K",
			buf.hover,
			{ desc = "Show hover documentation", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"gs",
			buf.signature_help,
			{ desc = "Show signature help", buffer = event.buf, noremap = true, silent = true }
		)

		-- Symbols
		keymap.set(
			"n",
			"<leader>sb",
			telescope_builtin.lsp_document_symbols,
			{ desc = "Show document symbols", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>sB",
			telescope_builtin.lsp_workspace_symbols,
			{ desc = "Show workspace symbols", buffer = event.buf, noremap = true, silent = true }
		)

		-- Code actions
		keymap.set(
			"n",
			"<leader>lr",
			"<cmd>LspRestart<cr>",
			{ desc = "LSP restart", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set(
			{ "n", "v" },
			"<leader>a",
			buf.code_action,
			{ desc = "Code action", buffer = event.buf, noremap = true, silent = true }
		)
		keymap.set(
			"n",
			"<leader>rn",
			buf.rename,
			{ desc = "Rename symbol", buffer = event.buf, noremap = true, silent = true }
		)
	end,
})
