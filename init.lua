-- Options
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "100"
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true

-- Globals
vim.g.mapleader = " "

-- Plugin Manager
require("config.lazy")

-- Colorscheme
vim.cmd(
    -- "colorscheme catppuccin"
    "colorscheme dracula"
    -- "colorscheme nord"
    -- "colorscheme rose-pine"
)

-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, desc = "[W]rite current file" })

-- delete a entire word
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true, silent = true })

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
