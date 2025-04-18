-- Setup localized vim variables
local cmd = vim.cmd
local keymap = vim.keymap
local o = vim.o

-- Import the mini.operators module
local mini_ops = require("mini.operators")

-- Define the global evaluation operator function
---@param type string
---@return nil
function _G.MiniOperators_evaluate(type)
	mini_ops.evaluate(type)
end

keymap.set("n", "<leader>=", function()
	o.operatorfunc = "v:lua.MiniOperators_evaluate"
	return "g@"
end, { expr = true, desc = "Evaluate (operator)" })

keymap.set("n", "<leader>==", function()
	o.operatorfunc = "v:lua.MiniOperators_evaluate"

	-- Move to start of line then trigger operator for the current line
	cmd.normal({ args = { "0g@$" }, bang = true })
end, { desc = "Evaluate current line" })
