local add = MiniDeps.add

add("nvim-mini/mini.files")

require("mini.files").setup()

vim.keymap.set("n", "<leader>fv", ":lua MiniFiles.open()<CR>", {
    noremap =  true,
    silent =  true,
    desc = "Open [F]ile [V]iewer"
})

