# NVIM

## Project Structure

```
nvim
├──  .editorconfig
├──  .gitignore
├──  .stylua.toml
├──  LICENSE
├──  README.md
├──  init.lua
└──  lua
    ├──  mini-nvim.lua
    ├──  plugins
    │   ├──  init.lua
    │   ├──  mini-colors.lua
    │   ├──  mini-comment.lua
    │   ├──  mini-deps.lua
    │   ├──  mini-diff.lua
    │   ├──  mini-files.lua
    │   ├──  mini-git.lua
    │   ├──  mini-icons.lua
    │   ├──  mini-pairs.lua
    │   ├──  mini-starter.lua
    │   ├──  mini-statusline.lua
    │   ├──  mini-tabline.lua
    │   └──  treesitter.lua
    └──  terminal.lua
```

## File Contents

### .editorconfig

```
root = true

[*]
charset = utf-8
end_of_line = lf

[*.lua]
indent_size = 4
indent_style = space
insert_final_newline = true
trim_trailing_whitespace = true


```

### .gitignore

```
.history
.vscode
lazy-lock.json

```

### .stylua.toml

```toml
call_parentheses = "Always"
collapse_simple_statement = "Never"
column_width = 100
indent_type = "Spaces"
indent_width = 4
line_endings = "Unix"
quote_style = "ForceDouble"
space_after_function_names = "Never"
syntax = "All"

[sort_requires]
enabled = true


```

### LICENSE

```
MIT License

Copyright (c) 2025 Julian L. F. Olate

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```

### README.md

```md
# My NeoVim Configuration

by Julian Olate ([@olatejulian](https://github.com/olatejulian))

## Installation

```sh
    git clone https://github.com/olatejulian/neovim

    cp -r neovim/* $HOME/.config/nvim

    rm -dfr neovim
```

```

### init.lua

```lua
-- Options
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "100"
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true

-- Globals
vim.g.mapleader = " "

-- Plugin Manager
-- require("config.lazy")
require("mini-nvim")

-- Colorscheme
-- vim.cmd(
    -- "colorscheme catppuccin"
    -- "colorscheme dracula"
    -- "colorscheme nord"
    -- "colorscheme rose-pine"
-- )

-- Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", {
    noremap = true,
    desc = "[W]rite current file"
})
vim.keymap.set("n", "<leader>q", ":bd<CR>", {
    noremap = true,
    desc = "[Q]uit current buffer"
})

-- delete a entire word
vim.keymap.set("i", "<C-BS>", "<C-w>", {
    noremap = true,
    silent = true
})
vim.keymap.set("i", "<C-H>", "<C-w>", {
    noremap = true,
    silent = true
})

-- move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {
    desc = "Move line down"
})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {
    desc = "Move line up"
})
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", {
    desc = "Move block down"
})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", {
    desc = "Move block up"
})

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Move to left window"
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Move to bottom window"
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Move to top window"
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Move to right window"
})

```

### lua/mini-nvim.lua

```lua
local function bootstrap()
    local path_package = vim.fn.stdpath('data') .. '/site'
    local mini_path = path_package .. '/pack/deps/start/mini.nvim'
    if not vim.loop.fs_stat(mini_path) then
        vim.cmd('echo "Installing `mini.nvim`" | redraw')
        local clone_cmd = {'git', 'clone', '--filter=blob:none', -- Uncomment next line to use 'stable' branch
        -- '--branch', 'stable',
        'https://github.com/nvim-mini/mini.nvim', mini_path}
        vim.fn.system(clone_cmd)
        vim.cmd('packadd mini.nvim | helptags ALL')
        vim.cmd('echo "Installed `mini.nvim`" | redraw')
    end

    require("plugins")
end

bootstrap()


```

### lua/plugins/init.lua

```lua
-- package manager plugin
require("plugins.mini-deps")

-- other
require("plugins.treesitter")

-- text editor behavior plugins
require("plugins.mini-comment")
require("plugins.mini-pairs")

-- General Workflow
require("plugins.mini-files")
require("plugins.mini-diff")
require("plugins.mini-git")

-- Appearance
-- require("plugins.mini-hues")
require("plugins.mini-colors")
require("plugins.mini-icons")
require("plugins.mini-starter")
require("plugins.mini-statusline")
require("plugins.mini-tabline")


```

### lua/plugins/mini-colors.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.colors")

require("mini.colors").setup()


```

### lua/plugins/mini-comment.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.comment")

require("mini.comment").setup()

```

### lua/plugins/mini-deps.lua

```lua
require("mini.deps").setup({
    path = {
        package = path_package
    }
})

```

### lua/plugins/mini-diff.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.diff")

require("mini.diff").setup()


```

### lua/plugins/mini-files.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.files")

require("mini.files").setup()

vim.keymap.set("n", "<leader>fv", ":lua MiniFiles.open()<CR>", {
    noremap =  true,
    silent =  true,
    desc = "Open [F]ile [V]iewer"
})


```

### lua/plugins/mini-git.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini-git")

require("mini.git").setup()


```

### lua/plugins/mini-icons.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.icons")

require("mini.icons").setup()


```

### lua/plugins/mini-pairs.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.pairs")

require("mini.pairs").setup()


```

### lua/plugins/mini-starter.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.starter")

require("mini.starter").setup()


```

### lua/plugins/mini-statusline.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.statusline")

require("mini.statusline").setup()


```

### lua/plugins/mini-tabline.lua

```lua
local add = MiniDeps.add

add("nvim-mini/mini.tabline")

require("mini.tabline").setup()


```

### lua/plugins/treesitter.lua

```lua
local add = MiniDeps.add

add( source = "nvim-treesitter/nvim-treesitter",
 hooks = { post_checkout = function() vim.cmd("TSUpdate") end},
)

require("nvim-treesitter").setup({
    auto_install = true,
    ensure_installed = { "lua", "python", "typescript"},
    highlight = { enable = true},
})


```

### lua/terminal.lua

```lua
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

```

