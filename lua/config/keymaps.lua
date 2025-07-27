-- delete a entire word
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down in insert" })
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up in insert" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

