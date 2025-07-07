-- Line number settings
vim.opt.number = true
vim.g.netrw_bufsettings = 'noma nomod nu nornu nobl nowrap ro' -- Black magic for line numbers in netrw
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Tabbing settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Save undo history
vim.opt.undofile = true

-- Searching settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
