return {
    "nvimtools/none-ls.nvim",
    config = function()
        local none_ls = require("null-ls")

        none_ls.setup({
            sources = {
                none_ls.builtins.diagnostics.mypy,
                none_ls.builtins.diagnostics.textidote,
                require("none-ls.diagnostics.eslint"),
                require("none-ls.diagnostics.ruff"),
                require("none-ls-luacheck.diagnostics.luacheck"),
            },
        })
    end,
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "gbprod/none-ls-luacheck.nvim",
    },
}
