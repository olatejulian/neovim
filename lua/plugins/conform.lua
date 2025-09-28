return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff" },
                tex = { "latexindent" },
                typescript = { "prettier" },
            },
        })

        vim.keymap.set(
            "n",
            "<leader>ft",
            conform.format,
            { noremap = true, silent = true, desc = "[F]ormat [T]ext" }
        )
    end,
}
