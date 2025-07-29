return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
        lazy = false,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" },
            })
        end,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        lazy = false,
        opts = { auto_install = true },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    pyright = {
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                        },
                    },
                },
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
                init_options = {
                    settings = {
                        format = { preview = true },
                    },
                },
            })



            vim.lsp.enable("ruff")

            vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
        lazy = false,
    },
}
