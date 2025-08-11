return {
    "akinsho/bufferline.nvim",
    config = function()
        vim.opt.termguicolors = true

        require("bufferline").setup()

        vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
}
