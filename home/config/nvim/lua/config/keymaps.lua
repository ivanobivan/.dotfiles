local map = vim.keymap.set

map("n", "<A-Left>", "<C-o>", { noremap = true, silent = true, desc = "Go back in jump list" })
map("n", "<A-Right>", "<C-i>", { noremap = true, silent = true, desc = "Go forward in jump list" })
