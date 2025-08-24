return {
    "chikko80/error-lens.nvim",
    config = function()
        require("error-lens").setup(nil, { enabled = true })
    end
}
