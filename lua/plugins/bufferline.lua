return {
    "akinsho/bufferline.nvim",
    config = function()
        vim.opt.termguicolors = true

        require("bufferline").setup({})

        vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
}
