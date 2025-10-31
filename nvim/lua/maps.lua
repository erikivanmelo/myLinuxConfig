-- maps/basic.lua - Complete non-plugin keymaps (clean + documented)
local map = vim.keymap.set
local silentArg = { silent = true }

vim.g.mapleader = ' '

-- nmap
local function nmap(lhs, rhs, desc, silent)
  silent = silent == nil and false or silent  -- default true
  local opts = { noremap = true, silent = silent }
  if desc then opts.desc = desc end
  map('n', lhs, rhs, opts)
end

-- imap
local function imap(lhs, rhs, desc, silent)
  silent = silent == nil and false or silent
  local opts = { noremap = true, silent = silent }
  if desc then opts.desc = desc end
  map('i', lhs, rhs, opts)
end

-- vmap
local function vmap(lhs, rhs, desc, silent)
  silent = silent == nil and false or silent
  local opts = { noremap = true, silent = silent }
  if desc then opts.desc = desc end
  map('v', lhs, rhs, opts)
end

-- xmap
local function xmap(lhs, rhs, desc, silent)
  silent = silent == nil and false or silent
  local opts = { noremap = true, silent = silent }
  if desc then opts.desc = desc end
  map('x', lhs, rhs, opts)
end

-----------------------------------------------------------
-- Window / IDE / General
-----------------------------------------------------------

-- Splits and reloads
nmap('<F4>', ':vsplit<CR>', 'Open vertical split', true)
imap('<F4>', '<Esc>:vsplit<CR>i', 'Open vertical split (insert mode)', true)

nmap('<F5>', ':e<CR>', 'Reload current buffer', true)
imap('<F5>', '<Esc>:e<CR>i', 'Reload current buffer (insert mode)', true)

-- Toggles and quitting
nmap('<leader>nr', ':set relativenumber!<CR>', 'Toggle relative line numbers', true)
nmap('qq', ':q!<CR>', 'Force quit without saving', true)

-- Editing
imap('<C-D>', '<C-W>', 'Delete previous word', true)

-- Terminal Home/End key compatibility
map({ 'n', 'v', 's', 'o' }, '<ESC>[8~', '<End>', { noremap = true, silent = true, desc = 'End key (terminal)' })
map({ 'n', 'v', 's', 'o' }, '<ESC>[7~', '<Home>', { noremap = true, silent = true, desc = 'Home key (terminal)' })

imap('<ESC>[8~', '<End>', 'End key (terminal)', true)
imap('<ESC>[7~', '<Home>', 'Home key (terminal)', true)

-----------------------------------------------------------
-- Save / Reload
-----------------------------------------------------------
map({ 'n', 'i' }, '<C-s>', '<Esc>:w<CR>', { desc = 'Save file', silent = true })

-----------------------------------------------------------
-- Code / CoC
-----------------------------------------------------------
nmap('<leader>ca', '<Plug>(coc-codeaction)', 'Code actions', true)
nmap('<leader>cR', '<Plug>(coc-rename)', 'Rename symbol', true)
nmap('<leader>cr', ':Telescope coc references<CR>', 'Find references', true)
nmap('<leader>cs', ':CocCommand clangd.switchSourceHeader<CR>', 'Switch header/source', true)
nmap('<leader>cD', ':Telescope coc diagnostics<CR>', 'Diagnostics', true)
nmap('<leader>cS', ':Telescope coc document_symbols<CR>', 'Symbols', true)
nmap('<leader>cd', '<Plug>(coc-definition)zz', 'Go to definition', true)
nmap('<leader>ci', '<Plug>(coc-implementation)zz', 'Go to implementation', true)
nmap('<leader>cy', '<Plug>(coc-type-definition)zz', 'Go to type definition', true)
nmap('<leader>cN', '<Plug>(coc-diagnostic-prev)', 'Prev diagnostic', true)
nmap('<leader>cn', '<Plug>(coc-diagnostic-next)', 'Next diagnostic', true)
vmap('<leader>ca', '<Plug>(coc-codeaction-selected)', 'Code Action on selection', true)
nmap('<leader>cf', '<Plug>(coc-format)', 'Format buffer', true)
nmap('<leader>ch', ':call CocActionAsync("doHover")<CR>', 'Show symbol docs', true)

-- Completion helpers (Coc)
vim.keymap.set('i', '<End>', function()
  return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or '<End>'
end, { expr = true, silent = true, desc = 'Confirm completion or move End' })

vim.keymap.set('i', '<Home>', function()
  return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#cancel']() or '<Home>'
end, { expr = true, silent = true, desc = 'Cancel completion or move Home' })

-----------------------------------------------------------
-- 💬 Comments
-----------------------------------------------------------
map({ 'n', 'v' }, '<leader>cc', '<Plug>NERDCommenterToggle', { desc = 'Toggle comment', silent = true })

-----------------------------------------------------------
-- 🔍 Find / Replace
-----------------------------------------------------------
nmap('<leader>fR', ':%s///gc<Left><Left><Left><Left>', 'Find & Replace (global)', false)
vmap('<leader>fR', '"ay:%s/<C-R>a//gc<Left><Left><Left>', 'Find & Replace (visual)', false)
xmap('p', 'pgvy', 'Paste without losing register', true)
vmap('/', '"ay/<C-R>a', 'Search selection', false)
nmap('n', 'nzz', 'Next search (centered)', true)
nmap('N', 'Nzz', 'Prev search (centered)', true)
nmap('<Esc>', ':noh<CR>', 'Clear highlights', true)
nmap('<leader>fs', ':set hlsearch!<CR>', 'Toggle hlsearch', true)

nmap('<leader>ff', function() Snacks.picker.files() end, 'Find files', true)
nmap('<leader>fg', function() Snacks.picker.lines() end, 'Search lines', true)
nmap('<leader>fc', function() Snacks.picker.grep() end, 'Grep content', true)
nmap('<leader>fb', function() Snacks.picker.buffers() end, 'Buffers',true)
nmap('<leader>fe', function() Snacks.explorer() end, 'File explorer', true)
nmap('<leader>fr', ':RnvimrToggle<CR>', 'Toggle Ranger', true)

nmap('<leader>ft', function()
  vim.opt.relativenumber = true
  Snacks.picker.todo_comments({
    keywords = {
      "TODO", "INFO", "WARNING",
      "FIXME", "BUG", "ISSUE",
      "OPTIM", "PERFORMANCE", "OPTIMIZE",
      "TESTING", "PASSED", "FAILED",
    },
  })
end, 'Find TODOs', true)

-----------------------------------------------------------
-- Navigation / Movement
-----------------------------------------------------------
nmap('<S-Up>', ':m-2<CR>', 'Move line up (normal)', true)
nmap('<S-Down>', ':m+<CR>', 'Move line down (normal)', true)
imap('<S-Up>', '<Esc>:m-2<CR>i<Right>', 'Move line up (insert)', true)
imap('<S-Down>', '<Esc>:m+<CR>i<Right>', 'Move line down (insert)', true)
vmap('<S-Up>', ":m '<-2<CR>gv=gv", 'Move selection up (visual)', true)
vmap('<S-Down>', ":m '>+1<CR>gv=gv", 'Move selection down (visual)', true)

map({ 'n', 'v'}, '<PageUp>', '10<Up>', silentArg)
map({ 'n', 'v'}, '<PageDown>', '10<Down>', silentArg)
imap('<PageUp>', '<Esc>10<Up>i', '', true)
imap('<PageDown>', '<Esc>10<Down>i', '', true)
nmap('<S-Left>', '<C-O>', 'Jump backward', true)
nmap('<S-Right>', '<C-I>', 'Jump forward', true)
nmap('<C-Home>', 'gg', 'Go to file start', true)
nmap('<C-End>', 'G', 'Go to file end', true)

-----------------------------------------------------------
-- Delete helpers
-----------------------------------------------------------
nmap('<C-Del>', 'dw', 'Delete next word', true)
nmap('<C-Backspace>', 'bdw', 'Delete previous word', true)
vmap('<Del>', '"_d', 'Delete selection (no yank)', true)
nmap('<Del>', '"_<Del>', 'Delete char (no yank)', true)
nmap('<Backspace>', 'X', 'Delete previous char', true)
nmap('dr', '"_dd', 'Delete line (no yank)', true)

-----------------------------------------------------------
-- Typing helpers
-----------------------------------------------------------
vmap('<', '<gv', 'Indent left and keep selection', true)
vmap('>', '>gv', 'Indent right and keep selection', true)
vmap('s', ':sort<CR>', 'Sort selection', true)

-----------------------------------------------------------
-- Git
-----------------------------------------------------------
nmap('<leader>gB', ':GitBlame<CR>', 'Git blame', true)
nmap('<leader>gc', ':!git commit -m ""<Left>', 'Git commit', false)
nmap('<leader>gp', ':!git pull<CR>', 'Git pull', true)
nmap('<leader>gP', ':!git push<CR>', 'Git push', true)
nmap('<leader>gb', function() Snacks.picker.git_branches() end, 'Git branches', true)
nmap('<leader>gd', ':DiffviewOpen<CR>', 'Git diff open', true)
nmap('<leader>gD', ':DiffviewClose<CR>', 'Git diff close', true)

-----------------------------------------------------------
-- Tabs
-----------------------------------------------------------
-- Clean up defaults
pcall(vim.keymap.del, 'n', '<C-W><C-D>')
pcall(vim.keymap.del, 'n', '<C-W>d')

imap('<C-t>', '<Esc>:tabnew<CR>i', 'New tab', true)
nmap('<C-t>', ':tabnew<CR>', 'New tab', true)
imap('<C-w>', '<Esc>:Tabclose<CR>i', 'Close tab', true)
nmap('<C-w>', ':Tabclose<CR>', 'Close tab', true)

-- Tab navigation Alt+1..9
for i = 1, 9 do
  local key = string.format('<M-%d>', i)
  map({ 'n', 'i', 'v' }, key, string.format(':tabn %d<CR>', i), vim.tbl_extend('force', silentArg, { desc = 'Go to tab ' .. i }))
end

-- Custom :Tabclose command
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

-----------------------------------------------------------
-- Tmux Navigator
-----------------------------------------------------------
map({ 'n', 'i' }, '<C-g>', '<Esc>:TmuxNavigateLeft<CR>i', { desc = 'Tmux Left', silent = true })
map({ 'n', 'i' }, '<C-h>', '<Esc>:TmuxNavigateUp<CR>i', { desc = 'Tmux Up', silent = true })
map({ 'n', 'i' }, '<C-l>', '<Esc>:TmuxNavigateRight<CR>i', { desc = 'Tmux Right', silent = true })
map({ 'n', 'i' }, '<C-c>', '<Esc>:TmuxNavigateDown<CR>i', { desc = 'Tmux Down', silent = true })

-----------------------------------------------------------
-- Notes / Obsidian
-----------------------------------------------------------
nmap('<leader>ng', ':GlobalNote<CR>', 'Open global note', true)
nmap('<leader>nn', ':Obsidian new<CR>', 'New note', true)
nmap('<leader>ns', ':Obsidian search<CR>', 'Search notes', true)

-----------------------------------------------------------
-- Misc
-----------------------------------------------------------
nmap('<C-a>', 'ggVG', 'Select all text in buffer', true)
nmap('yf', ':let @+=expand("%:p")<CR>:echo "File path copied!"<CR>', 'Copy file path to clipboard', true)
