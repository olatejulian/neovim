return {
    "nvimtools/none-ls.nvim",
    config = function()
        local none_ls = require("null-ls")

        none_ls.setup({
            sources = {
                none_ls.builtins.diagnostics.mypy,
                none_ls.builtins.formatting.prettier,
                none_ls.builtins.formatting.stylua,
                require("none-ls.diagnostics.eslint"),
                require("none-ls-luacheck.diagnostics.luacheck"),
            },
        })

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end,
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "gbprod/none-ls-luacheck.nvim",
    }
}
