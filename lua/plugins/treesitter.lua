local add = MiniDeps.add

add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
        post_checkout = function()
            vim.cmd("TSUpdate")
        end
    },
    checkout = "master",
    monitor = "main"
})

require("nvim-treesitter").setup({
    auto_install = true,
    ensure_installed = {"lua", "python", "typescript"},
    highlight = {
        enable = true
    }
})

