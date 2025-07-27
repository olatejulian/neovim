return {
    "MarcHamamji/runner.nvim",
    config = function()
        require("runner").setup({ position = "right", width = 80 })

        vim.keymap.set("n", "<F5>", require("runner").run, { desc = "Run code" })
        vim.keymap.set("n", "<leader>ra", require("runner").autorun, { desc = "Auto run on save" })
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
