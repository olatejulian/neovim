return {
    "nvimtools/none-ls.nvim",
    config = function()
        local none_ls = require("null-ls")

        none_ls.setup({
            sources = {
                none_ls.builtins.diagnostics.mypy,
                none_ls.builtins.diagnostics.textidote,
                none_ls.builtins.formatting.latexindent,
                none_ls.builtins.formatting.prettier.with({
                    prefer_local = "node_modules/.bin",
                }),
                none_ls.builtins.formatting.shfmt,
                none_ls.builtins.formatting.stylua,
                require("none-ls.diagnostics.eslint"),
                require("none-ls.diagnostics.ruff"),
                require("none-ls.formatting.ruff"),
                require("none-ls-luacheck.diagnostics.luacheck"),
            },
        })

        vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, { desc = "[F]ormat [T]ext" })
    end,
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "gbprod/none-ls-luacheck.nvim",
    },
}
