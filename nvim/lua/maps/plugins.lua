-- maps/plugins.lua - keymaps that depend on plugins
local map = vim.keymap.set
local opts = { silent = true }

-- Git blame (git-blame.vim)
map('n', '<F1>', ':GitBlame<CR>', opts)
map('i', '<F1>', '<Right><Esc>:GitBlame<CR>i', opts)

-- Diffview
map('n', '<F6>', ':DiffviewOpen<cr>', opts)
map('i', '<F6>', '<Esc>:DiffviewOpen<cr>', opts)
map('n', '<leader><F6>', ':DiffviewClose<cr>', opts)

-- coc.nvim
map('i', '<F2>', '<Esc><Plug>(coc-definition)<Esc>i', opts)
map('n', '<F2>', '<Plug>(coc-definition)', opts)
-- PUM confirm on <End>
vim.api.nvim_set_keymap('i', '<End>', "coc#pum#visible()? coc#pum#confirm() : '<End>'", { noremap = true, silent = true, expr = true })

-- FZF / ripgrep / buffer lines
map('n', '<leader>ff', ':FZF<cr>', opts)
map('n', '<leader>fc', ':Rg<cr>', opts)
map('n', '<leader>fg', ':BLines<cr>', opts)
map('v', '<leader>fg', 'y:BLines<cr><C-S-V>', opts)

-- tmux navigator
map('n', '<C-g>', ':TmuxNavigateLeft<cr>', opts)
map('i', '<C-g>', '<Esc>:TmuxNavigateLeft<cr>i', opts)
map('n', '<C-c>', ':TmuxNavigateDown<cr>', opts)
map('n', '<C-h>', ':TmuxNavigateUp<cr>', opts)
map('n', '<C-l>', ':TmuxNavigateRight<cr>', opts)
map('i', '<C-l>', '<Esc>:TmuxNavigateRight<cr>i', opts)

-- NERDTree / rnvimr
map('n', '<F7>', ':NERDTreeToggle<cr>', opts)
map('i', '<F7>', '<Esc>:NERDTreeToggle<cr>', opts)
map('n', 'ff', ':RnvimrToggle<cr>', opts)

-- FZF buffers list
map('n', '<Leader>b', ':Buffers<cr>', opts)

-- Checklist plugin
map('n', '<leader>ct', ':ChecklistToggleCheckbox<cr>', opts)
map('n', '<leader>ce', ':ChecklistEnableCheckbox<cr>', opts)
map('n', '<leader>cd', ':ChecklistDisableCheckbox<cr>', opts)
map('v', '<leader>ct', ':ChecklistToggleCheckbox<cr>', opts)
map('v', '<leader>ce', ':ChecklistEnableCheckbox<cr>', opts)
map('v', '<leader>cd', ':ChecklistDisableCheckbox<cr>', opts)

-- NERDCommenter
map('n', '<leader>cc', '<plug>NERDCommenterToggle', opts)
map('v', '<leader>cc', '<plug>NERDCommenterToggle', opts)
