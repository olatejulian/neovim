return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<leader>fc', builtin.live_grep, { desc = '[F]ind [C]ode' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers ' })
            vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [H]elp' })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            require("telescope").load_extension("ui-select")
        end,
    },
}
