local term = { buf = nil, win = nil }

local function toggle_term()
    for _, w in ipairs(vim.api.nvim_list_wins()) do
        local b = vim.api.nvim_win_get_buf(w)

        if term.buf and b == term.buf then
            vim.api.nvim_win_close(w, true)

            if vim.api.nvim_buf_is_valid(term.buf) then
                vim.api.nvim_buf_delete(term.buf, { force = true })
            end

            term.buf, term.win = nil, nil

            return
        end
    end

    vim.cmd("botright 15split")

    vim.cmd("terminal")

    local b = vim.api.nvim_get_current_buf()

    term.buf = b

    term.win = vim.api.nvim_get_current_win()

    vim.cmd("startinsert")
end

vim.keymap.set("n", "<C-j>", toggle_term, { noremap = true, silent = true, desc = "Toggle terminal (open/kill)" })

vim.keymap.set(
    "t",
    "<Esc><Esc>",
    "<C-\\><C-n><C-w>p",
    { noremap = true, silent = true, desc = "Exit terminal mode and go to previous window" }
)
