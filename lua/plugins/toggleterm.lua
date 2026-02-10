local add = MiniDeps.add

add("akinsho/toggleterm.nvim")

require("toggleterm").setup({
    size = 15,
    open_mapping = [[<leader>t]],
    direction = "float", -- float, horizontal, vertical
    persist_size = true,
})

-- Optional: easy key to toggle terminal insert → normal
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.keymap.set("ter", "<Esc>", "<C-\\><C-n>", { buffer = true })
    end,
})
