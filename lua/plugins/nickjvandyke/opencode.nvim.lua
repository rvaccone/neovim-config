return {
	"nickjvandyke/opencode.nvim",
	version = "*",
	keys = function()
		local lazy_key = require("utils.keymap").lazy_key
		local opencode = require("opencode")

		return {
			lazy_key("<leader>oa", function()
				require("opencode").ask("@this: ", { submit = true })
			end, "Ask opencode", { mode = { "n", "v" } }),
			lazy_key("<leader>ow", function()
				require("opencode").ask("@workspace: ", { submit = true })
			end, "Ask opencode with workspace context", { mode = { "n", "v" } }),

			lazy_key("<leader>os", function()
				require("opencode").select()
			end, "Execute opencode action", { mode = { "n", "v" } }),

			lazy_key("<leader>ot", function()
				require("opencode").toggle()
			end, "Toggle opencode"),

			lazy_key("<leader>oj", function()
				opencode.command("session.half.page.down")
			end, "Scroll opencode down"),
			lazy_key("<leader>ok", function()
				opencode.command("session.half.page.up")
			end, "Scroll opencode up"),
		}
	end,
}
