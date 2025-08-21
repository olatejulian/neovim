return {
    "MarcHamamji/runner.nvim",
    config = function()
        require("runner").setup({ position = "right", width = 80 })

        local runner = require("runner")

        vim.keymap.set("n", "<F5>", runner.run, { desc = "Run code" })
        vim.keymap.set("n", "<leader>rs", runner.autorun, { desc = "[R]un on [S]ave" })
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
