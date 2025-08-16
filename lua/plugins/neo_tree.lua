return {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {
            silent = true,
        })
    end,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    lazy = false,
}
