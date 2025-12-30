-- Setup localized vim variables
local api = vim.api
local buf = vim.lsp.buf
local log = vim.log
local notify = vim.notify

-- Import required modules
local map = require("utils.keymap").map
local telescope_builtin = require("telescope.builtin")
local windows = require("utils.windows")

-- Create autocmd group
local group = api.nvim_create_augroup("LSPConfig", { clear = true })

--- Opens a LSP location in a new window
---@param method "declaration"|"definition"|"type_definition" The LSP method to use
---@param split_direction "vsplit"|"split" The split direction to use when creating a new window
---@return nil
local function open_lsp_location_in_new_window(method, split_direction)
	local current_buf = api.nvim_get_current_buf()
	local current_windows = #windows.list_content_windows()
	windows.focus_or_create_window(current_windows + 1, split_direction)
	api.nvim_win_set_buf(0, current_buf)

	if method == "declaration" then
		buf.declaration()
	elseif method == "definition" then
		buf.definition()
	elseif method == "type_definition" then
		buf.type_definition()
	else
		notify("Unsupported LSP method: " .. tostring(method), log.levels.ERROR)
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
		map("gd", buf.definition, "Go to definition", { buffer = event.buf })

		map("<leader>gd", function()
			open_lsp_location_in_new_window("definition", "vsplit")
		end, "Go to definition in a new window", { buffer = event.buf })

		map("<leader>vgd", function()
			open_lsp_location_in_new_window("definition", "split")
		end, "Go to definition in a new vertical window", { buffer = event.buf })

		-- Declaration
		map("gD", buf.declaration, "Go to declaration", { buffer = event.buf })

		map("<leader>gD", function()
			open_lsp_location_in_new_window("declaration", "vsplit")
		end, "Go to declaration in a new window", { buffer = event.buf })

		map("<leader>vgD", function()
			open_lsp_location_in_new_window("declaration", "split")
		end, "Go to declaration in a new vertical window", { buffer = event.buf })

		-- Implementation
		map("gi", telescope_builtin.lsp_implementations, "Go to implementation", { buffer = event.buf })

		-- Type Definition
		map("gt", buf.type_definition, "Go to type definition", { buffer = event.buf })

		map("<leader>gt", function()
			open_lsp_location_in_new_window("type_definition", "vsplit")
		end, "Go to type definition in a new window", { buffer = event.buf })

		map("<leader>vgt", function()
			open_lsp_location_in_new_window("type_definition", "split")
		end, "Go to type definition in a new vertical window", { buffer = event.buf })

		-- References
		map("gr", telescope_builtin.lsp_references, "Show references", { buffer = event.buf })

		-- Documentation
		map("K", buf.hover, "Show hover documentation", { buffer = event.buf })
		map("gs", buf.signature_help, "Show signature help", { buffer = event.buf })

		-- Symbols
		map("<leader>sb", telescope_builtin.lsp_document_symbols, "Show document symbols", { buffer = event.buf })

		map("<leader>sB", telescope_builtin.lsp_workspace_symbols, "Show workspace symbols", { buffer = event.buf })

		-- Code actions
		map("<leader>lr", "<cmd>LspRestart<cr>", "LSP restart", { buffer = event.buf })

		map("<leader>a", buf.code_action, "Code action", { mode = { "n", "v" }, buffer = event.buf })

		map("<leader>rn", buf.rename, "Rename symbol", { buffer = event.buf })
	end,
})
