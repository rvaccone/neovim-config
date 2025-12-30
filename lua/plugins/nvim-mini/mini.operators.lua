-- Setup localized vim variables
local cmd = vim.cmd
local o = vim.o

return {
	"nvim-mini/mini.operators",
	version = false,
	config = function()
		require("mini.operators").setup({
			-- Evaluate text and replace with output
			evaluate = {
				prefix = "", -- Will be defined in the corresponding keymap file
			},

			-- Exchange text regions
			exchange = {
				prefix = "",
			},

			-- Multiply (duplicate) text
			multiply = {
				prefix = "",
			},

			-- Replace text with register
			replace = {
				prefix = "",
			},

			-- Sort text
			sort = {
				prefix = "",
			},
		})

		-- Define global operator function
		_G.MiniOperators_evaluate = function(type)
			require("mini.operators").evaluate(type)
		end
	end,
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key

		return {
			lazy_key("<leader>=", function()
				o.operatorfunc = "v:lua.MiniOperators_evaluate"
				return "g@"
			end, "Evaluate (operator)", { expr = true }),

			lazy_key("<leader>==", function()
				o.operatorfunc = "v:lua.MiniOperators_evaluate"
				cmd.normal({ args = { "0g@$" }, bang = true })
			end, "Evaluate current line"),
		}
	end,
}
