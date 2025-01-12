-- Setup localized vim variables
local api = vim.api
local keymap = vim.keymap
local buf = vim.lsp.buf

-- Create autocmd group
local group = api.nvim_create_augroup("LSPConfig", { clear = true })

-- Setup LSP keymaps when LSP attaches to a buffer
api.nvim_create_autocmd("LspAttach", {
	group = group,
	desc = "LSP actions",
	callback = function(event)
		-- Navigation
		keymap.set("n", "gd", buf.definition, { desc = "Go to definition", buffer = event.buf })
		keymap.set("n", "gD", buf.declaration, { desc = "Go to declaration", buffer = event.buf })
		keymap.set("n", "gi", buf.implementation, { desc = "Go to implementation", buffer = event.buf })
		keymap.set("n", "go", buf.type_definition, { desc = "Go to type definition", buffer = event.buf })
		keymap.set("n", "gr", buf.references, { desc = "Show references", buffer = event.buf })

		-- Documentation
		keymap.set("n", "K", buf.hover, { desc = "Show hover documentation", buffer = event.buf })
		keymap.set("n", "gs", buf.signature_help, { desc = "Show signature help", buffer = event.buf })

		-- Code actions
		keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP restart", buffer = event.buf })
		keymap.set("n", "<leader>a", buf.code_action, { desc = "Code action", buffer = event.buf })
		keymap.set("n", "<leader>rn", buf.rename, { desc = "Rename symbol", buffer = event.buf })
	end,
})
