local Terminal = {}

Terminal.buffer = nil
Terminal.window = nil

function Terminal:toggle()
    local windows = vim.api.nvim_list_wins()

    for _, window in ipairs(windows) do
        local buffer = vim.api.nvim_win_get_buf(window)

        if self.buffer and buffer == self.buffer then
            vim.api.nvim_win_close(window, true)

            local is_buffer_valid = vim.api.nvim_buf_is_valid(self.buffer)

            if is_buffer_valid then
                vim.api.nvim_buf_delete(self.buffer, { force = true })
            end

            self.buffer, self.window = nil, nil

            return
        end
    end

    -- self:openBottom()
    self:openFloating()
end

function Terminal:openBottom()
    vim.cmd("botright 15split")

    vim.cmd("terminal")

    self.buffer = vim.api.nvim_get_current_buf()

    self.window = vim.api.nvim_get_current_win()

    vim.cmd("startinsert")
end

function Terminal:openFloating()
    self.buffer = vim.api.nvim_create_buf(false, true)

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)


    self.window = vim.api.nvim_open_win(self.buffer, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
    })

    vim.fn.termopen(vim.o.shell)

    vim.cmd("startinsert")
end

local function toggle_terminal()
    Terminal:toggle()
end

vim.keymap.set({ "n", "t" }, "<leader>t", toggle_terminal, {
    desc = "Toggle terminal",
    noremap = true,
    silent = true,
})

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><C-w>p", {
    noremap = true,
    silent = true,
    desc = "Exit terminal mode and go to previous window",
})
