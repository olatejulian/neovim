return {
    "windwp/nvim-autopairs",
    dependencies = { "nvim-cmp" },
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,         -- Use treesitter to avoid pairs in strings, comments
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            map_cr = true,           -- Auto-indent on <CR>
            map_bs = true,           -- Backspace deletes pair
            enable_moveright = true, -- Skip over closing pair
            enable_afterquote = true,
            enable_check_bracket_line = true,
            enable_bracket_in_quote = true,
            break_undo = true,
        })
        -- Integration with nvim-cmp
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
