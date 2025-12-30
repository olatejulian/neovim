-- plugin specs remain largely the same for mason / mason-lspconfig
local mason = {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup({})
    end,
    lazy = false,
}

local mason_lspconfig = {
    "mason-org/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls" },
            automatic_installation = true, -- optional: adapt if “auto_install” key changed
        })
    end,
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    lazy = false,
    -- The opts field may be dropped or adapted if plugin supports it
}

local nvim_lspconfig = {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = { enable = true },
    },
    config = function()
        -- Diagnostics config
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
                spacing = 4,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Keymaps - now using LspAttach to make them buffer-local after attach
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local bufnr = ev.buf
                local opts = { buffer = bufnr }
                -- rename
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                -- hover
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                -- definition/declaration
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                -- code action
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        -- Optionally set up any global defaults via vim.lsp.config('*', {...})
        vim.lsp.config("*", {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        -- Then **customise** individual servers
        vim.lsp.config("lua_ls", {
            -- merge defaults with your specifics
            -- e.g., settings = { Lua = { /*…*/ } }
        })
        vim.lsp.enable("lua_ls")

        vim.lsp.config("pyright", {
            settings = {
                pyright = { disableOrganizeImports = true },
                python = { analysis = { typeCheckingMode = "off" } },
            },
        })
        vim.lsp.enable("pyright")

        vim.lsp.config("ruff", {
            init_options = {
                settings = {
                    format = { preview = true },
                },
            },
        })
        vim.lsp.enable("ruff")

        vim.lsp.enable("bashls")
        vim.lsp.enable("ts_ls")

        -- For custom/hypr LSP server (not part of nvim-lspconfig predefs)
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "*.hl", "hypr*.conf" },
            callback = function(_)
                vim.lsp.start({
                    name = "hyprlang",
                    cmd = { "hyprls" },
                    root_dir = vim.loop.cwd(), -- prefer vim.loop.cwd() over vim.fn.getcwd()
                })
            end,
        })
    end,
    lazy = false,
}

return {
    mason,
    mason_lspconfig,
    nvim_lspconfig,
}
