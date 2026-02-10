local add = MiniDeps.add

add("nvim-telescope/telescope.nvim")
add("nvim-telescope/telescope-ui-select.nvim")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles"})
vim.keymap.set('n', '<leader>fc', builtin.live_grep, { desc = '[F]ind [C]ode' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers ' })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [H]elp' })

require("telescope").setup({
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown()
        }
    }
})

require("telescope").load_extension("ui-select")

