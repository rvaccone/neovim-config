-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>sp", function()
	require("spectre").toggle()
end, {
	desc = "Toggle Spectre (project-wide search/replace)",
	noremap = true,
	silent = true,
})
