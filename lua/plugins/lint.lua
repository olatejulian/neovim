local add = MiniDeps.add

add("mfussenegger/nvim-lint")

local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "ruff" },
    tex = { "chktex" },
    typescript = { "eslint" },
}
