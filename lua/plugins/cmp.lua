local add = MiniDeps.add

-- Core completion engine
add("hrsh7th/nvim-cmp")

-- LSP source for cmp
add("hrsh7th/cmp-nvim-lsp")

-- Optional extra sources
add("hrsh7th/cmp-buffer")
add("hrsh7th/cmp-path")

-- Snippet engine + source
add("L3MON4D3/LuaSnip")
add("saadparwaiz1/cmp_luasnip")

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),       -- manual trigger
        ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
        ["<C-n>"] = cmp.mapping.select_next_item(),    -- nav next
        ["<C-p>"] = cmp.mapping.select_prev_item(),    -- nav prev
        ["<C-e>"] = cmp.mapping.abort(),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },  -- LSP suggestions
        { name = "luasnip" },   -- snippet completions
        { name = "codeium"},
    }, {
        { name = "buffer" },    -- fallback buffer words
        { name = "path" },      -- file path suggestions
    }),

    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
})
