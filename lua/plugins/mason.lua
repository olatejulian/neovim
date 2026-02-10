local add = MiniDeps.add

add({source = "neovim/nvim-lspconfig"})
add({source = "mason-org/mason.nvim"})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",       -- Lua LSP for Neovim config
        "pyright",      -- Python
        "ts_ls",        -- TypeScript/JavaScript
      },
      automatic_enable = true,  -- auto-enable servers after install
    })
  end,
})
