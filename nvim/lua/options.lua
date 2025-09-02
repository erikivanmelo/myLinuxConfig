-- options.lua - Lua equivalents for Vim 'set' options
-- Migrated from ~/.vimrc

local opt = vim.opt

-- Numbers and UI
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.showcmd = true
opt.ruler = true
opt.cursorline = true
opt.showmatch = true
opt.termguicolors = true
opt.laststatus = 2
opt.showmode = false -- noshowmode

-- Mouse and clipboard
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'

-- Encoding
opt.encoding = 'utf-8'

-- Search
opt.ignorecase = true
opt.incsearch = false -- noincsearch
opt.shortmess:append('atI')

-- Files
opt.autoread = true
opt.tags = { './tags', 'tags;$HOME' }

-- Indentation and tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.cinoptions:append('L0')

-- Folding (Treesitter)
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99

-- Filetype plugins/indent (kept for completeness)
vim.cmd('filetype plugin indent on')
