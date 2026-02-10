local add = MiniDeps.add

add("stevearc/conform.nvim")

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
        tex = { "tex-fmt" },
        typescript = { "prettier" },
    },
})

vim.keymap.set(
    "n",
    "<leader>ft",
    conform.format,
    { noremap = true, silent = true, desc = "[F]ormat [T]ext" }
)
