-- Setup localized vim variables
local cmd = vim.cmd
local keymap = vim.keymap
local o = vim.o

local mini_ops = require("mini.operators")

-- Define the global evaluation operator function
function _G.MiniOperators_evaluate(type)
	mini_ops.evaluate(type)
end

-- Existing operator mapping for motions:
keymap.set("n", "<leader>=", function()
	o.operatorfunc = "v:lua.MiniOperators_evaluate"
	return "g@"
end, { expr = true, desc = "Evaluate (operator)" })

-- New mapping for evaluating the entire line:
keymap.set("n", "<leader>==", function()
	o.operatorfunc = "v:lua.MiniOperators_evaluate"
	-- Move to start of line then trigger operator for the current line
	cmd.normal({ args = { "0g@$" }, bang = true })
end, { desc = "Evaluate current line" })
