-- maps/basic.lua - basic (non-plugin) keymaps
local map = vim.keymap.set
local opts = { silent = true }

-- Leader
vim.g.mapleader = ' '

-- Terminal key sequences for Home/End
map({ 'n', 'v', 's', 'o' }, '<ESC>[8~', '<End>', opts)
map({ 'n', 'v', 's', 'o' }, '<ESC>[7~', '<Home>', opts)
map('i', '<ESC>[8~', '<End>', opts)
map('i', '<ESC>[7~', '<Home>', opts)

-- Vertical split
map('n', '<F4>', ':vsplit<CR>', opts)
map('i', '<F4>', '<Esc>:vsplit<CR>i', opts)

-- Text navigation
map('n', '<M-Up>', ':m-2<CR>', opts)
map('n', '<M-Down>', ':m+<CR>', opts)
map('i', '<M-Up>', '<Esc>:m-2<CR>i<Right>', opts)
map('i', '<M-Down>', '<Esc>:m+<CR>i<Right>', opts)

map('v', '<PageUp>', '10<Up>', opts)
map('v', '<PageDown>', '10<Down>', opts)
map('n', '<PageUp>', '10<Up>', opts)
map('n', '<PageDown>', '10<Down>', opts)
map('i', '<PageUp>', '<Esc>10<Up>i', opts)
map('i', '<PageDown>', '<Esc>10<Down>i', opts)

map('n', '<M-Left>', '<C-O>', opts)
map('n', '<M-Right>', '<C-I>', opts)

map('n', '<C-Home>', 'gg', opts)
map('n', '<C-End>', 'G', opts)

-- Toggle highlights and numbers
map('n', '<F3>', ':set hlsearch!<CR>', opts)
map('i', '<F3>', '<Esc>:set hlsearch!<CR>i<Right>', opts)
map('n', '<leader>nr', ':set relativenumber!<CR>', opts)

-- Replace text helpers
map('i', '<C-M-f>', '<Esc>:%s///gc<Left><Left><Left><Left>', opts)
map('n', '<C-M-f>', ':%s///gc<Left><Left><Left><Left>', opts)
map('v', '<C-M-f>', 'y:%s/<C-R>"//gc<Left><Left><Left>', opts)

-- Delete helpers
map('n', '<C-Del>', 'dw', opts)
map('n', '<C-Backspace>', 'bdw', opts)
map('v', '<Del>', '"_d', opts)
map('n', '<Del>', '"_<Del>', opts)
map('n', '<Backspace>', 'X', opts)

-- :W user command and save mappings
vim.api.nvim_create_user_command('W', function()
  local path = vim.fn.expand('%:p')
  if vim.fn.filereadable(path) == 1 then
    vim.cmd('write')
  else
    local nuevo = vim.fn.input('Filename: ')
    if nuevo ~= '' then
      vim.cmd('write ' .. nuevo)
    end
  end
end, {})
map('i', '<C-s>', '<Esc>:W<CR>', opts)
map('n', '<C-s>', ':W<CR>', opts)

-- :Tabclose user command and helpers
vim.api.nvim_create_user_command('Tabclose', function()
  local bufnr = vim.fn.bufnr('%')
  local wins = vim.fn.win_findbuf(bufnr)
  if #wins > 1 then
    vim.cmd('q')
    return
  end
  local last = vim.fn.bufnr('$')
  local listed = 0
  for b = 1, last do
    if vim.fn.buflisted(b) == 1 then
      listed = listed + 1
    end
  end
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
  if listed == 1 and (#lines == 1 and lines[1] == '') then
    vim.cmd('q!')
  else
    vim.cmd('bd')
  end
end, {})

-- Unmap defaults that conflict and remap window close
pcall(vim.keymap.del, 'n', '<C-W><C-D>')
pcall(vim.keymap.del, 'n', '<C-W>d')
map('i', '<C-w>', '<Esc>:Tabclose<CR>i', opts)
map('n', '<C-w>', ':Tabclose<CR>', opts)

-- Tabs
map('n', '<Leader>tr', ':tabp<CR>', opts)
map('i', '<C-t>', '<Esc>:tabnew<CR>i', opts)
map('n', '<C-t>', ':tabnew<CR>', opts)
map('n', '<Leader>ts', ':tabn<cr>', opts)

-- Tab navigation Alt+1..9
for i = 1, 9 do
  local key = string.format('<M-%d>', i)
  map('n', key, string.format(':tabn %d<CR>', i), opts)
  map('i', key, string.format('<Esc>:tabn %d<CR>i', i), opts)
  map('v', key, string.format('<Esc>:tabn %d<CR>', i), opts)
end

-- Buffers (basic)
map('n', '<Leader><C-t>', ':new tab<cr>', opts)
map('n', '<Leader><C-w>', ':bd<cr>', opts)

-- Misc
map('i', '<C-D>', '<C-W>', opts)
map('n', '<C-a>', 'ggVG', opts)
map('n', '<F12>', 'i', opts)
map('v', '<F12>', '<Esc>', opts)
map('i', '<F12>', '<Right><Esc>', opts)
map('n', '<F5>', ':e<CR>', opts)
map('i', '<F5>', 'i:e<CR><right>i', opts)
map('n', 'qq', ':q!<CR>', opts)

-- Remap <C-u>
map('n', '<C-u>', '<C-r>', opts)
