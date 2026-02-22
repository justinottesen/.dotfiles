vim.g.mapleader = " "

-- Line number settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
-- Line numebrs in netrw
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- Tabbing settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Save undo history
vim.opt.undofile = true

-- Searching settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use system clipboard for copy and paste
vim.opt.clipboard = "unnamedplus"
