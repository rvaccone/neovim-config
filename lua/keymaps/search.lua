-- Setup localized vim variables
local keymap = vim.keymap

keymap.set("n", "<leader>sr", ":%s/", {
	desc = "Start search and replace",
	noremap = true,
})

keymap.set("v", "<leader>sr", ":s/", {
	desc = "Replace in visual selection",
	noremap = true,
})

keymap.set("n", "<leader>sw", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", {
	desc = "Replace word under cursor",
	noremap = true,
})

keymap.set("n", "<leader>sn", ":nohl<CR>", {
	desc = "Clear search highlighting",
	noremap = true,
	silent = true,
})
