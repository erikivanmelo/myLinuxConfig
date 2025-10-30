-- maps/basic.lua - basic (non-plugin) keymaps
local map = vim.keymap.set
local silent = { silent = true }

-- Leader
vim.g.mapleader = ' '

-- Vertical split
  map('n', '<F4>', ':vsplit<CR>', silent)
  map('i', '<F4>', '<Esc>:vsplit<CR>i', silent)

-- Code
  map('n', '<leader>cs', ':CocCommand clangd.switchSourceHeader<cr>', silent)

  map('n', '<leader>cD', ':Telescope coc diagnostics<cr>', silent)
  map('n', '<leader>cS', ':Telescope coc document_symbols<cr>', silent)
  map('n', '<leader>cd', '<Plug>(coc-definition)', silent)
  map('n', '<leader>ci', '<Plug>(coc-implementation)', silent)
  map('n', '<leader>cy', '<Plug>(coc-type-definition)', silent)
  map('n', '<leader>cr', ':Telescope coc references<cr>', silent)

  -- NERDCommenter
  map('n', '<leader>cc', '<plug>NERDCommenterToggle', silent)
  map('v', '<leader>cc', '<plug>NERDCommenterToggle', silent)

  -- Mapeos para completado con CoC
  map('i', '<End>', function()
    return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#confirm']() or '<End>'
  end, { expr = true })

  map('i', '<Home>', function()
    return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#cancel']() or '<Home>'
  end, { expr = true })

-- Find and replace
  -- Replace
  map('n', '<leader>fR', ':%s///gc<Left><Left><Left><Left>')
  map('v', '<leader>fR', '"ay:%s/<C-R>a//gc<Left><Left><Left>')
  map('x', 'p', 'pgvy', { noremap = true, silent = true })

  -- Find
  map('v', '/', '"ay/<C-R>a')
  map('n', 'n', 'nzz', silent)
  map('n', 'N', 'Nzz', silent)
  map('n', '<Esc>', ':noh<CR>', silent)
  map('n', '<leader>fs', ':set hlsearch!<CR>', silent)

  map('n', '<leader>ff', ':lua Snacks.picker.files()<cr>', silent)
  map('n', '<leader>fg', ':lua Snacks.picker.lines()<cr>', silent)
  map('n', '<leader>fc', ':lua Snacks.picker.grep()<cr>', silent)
  map('n', '<leader>fb', ':lua Snacks.picker.buffers()<cr>', silent)
  map('n', '<leader>fe', ':lua Snacks.explorer()<cr>', silent)
  map('n', '<leader>fr', ':RnvimrToggle<cr>', silent)

  vim.keymap.set("n", "<leader>ft",
    function()
      vim.opt.relativenumber = true
      Snacks.picker.todo_comments({
        keywords = {
          "TODO",
          "INFO",
          "WARNING",
          "FIXME", "BUG", "ISSUE",
          "OPTIM", "PERFORMANCE", "OPTIMIZE",
          "TESTING", "PASSED", "FAILED"
        }
      })
    end, { desc = "Find TODOs ", silent = true }
  )

-- Text navigation
  map('n', '<S-Up>'  , ':m-2<CR>', silent)
  map('n', '<S-Down>', ':m+<CR>', silent)
  map('i', '<S-Up>'  , '<Esc>:m-2<CR>i<Right>', silent)
  map('i', '<S-Down>', '<Esc>:m+<CR>i<Right>', silent)
  map('v', '<S-Up>'  , ":m '<-2<CR>gv=gv", silent)
  map('v', '<S-Down>', ":m '>+1<CR>gv=gv", silent)

  map('v', '<PageUp>', '10<Up>', silent)
  map('v', '<PageDown>', '10<Down>', silent)
  map('n', '<PageUp>', '10<Up>', silent)
  map('n', '<PageDown>', '10<Down>', silent)
  map('i', '<PageUp>', '<Esc>10<Up>i', silent)
  map('i', '<PageDown>', '<Esc>10<Down>i', silent)

  map('n', '<S-Left>', '<C-O>', silent)
  map('n', '<S-Right>', '<C-I>', silent)

  map('n', '<C-Home>', 'gg', silent)
  map('n', '<C-End>', 'G', silent)

-- Delete helpers
  map('n', '<C-Del>', 'dw', silent)
  map('n', '<C-Backspace>', 'bdw', silent)
  map('v', '<Del>', '"_d', silent)
  map('n', '<Del>', '"_<Del>', silent)
  map('n', '<Backspace>', 'X', silent)
  map('n', 'dr', '"_dd', silent)-- delete line



-- Misc
  map('i', '<C-D>', '<C-W>', silent)
  map('n', '<C-a>', 'ggVG', silent)
  map('n', 'yf', ':let @+=expand("%:p")<CR>:echo "File path copied!"<CR>', silent)

-- IDE
  map('n', '<leader>nr', ':set relativenumber!<CR>', silent)
  map('n', 'qq', ':q!<CR>', silent)
  map('n', '<F5>', ':e<CR>', silent)
  map('i', '<F5>', 'i:e<CR><right>i', silent)

  -- Terminal key sequences for Home/End
  map({ 'n', 'v', 's', 'o' }, '<ESC>[8~', '<End>', silent)
  map({ 'n', 'v', 's', 'o' }, '<ESC>[7~', '<Home>', silent)
  map('i', '<ESC>[8~', '<End>', silent)
  map('i', '<ESC>[7~', '<Home>', silent)

  -- Save
  map('i', '<C-s>', '<Esc>:w<CR>', silent)
  map('n', '<C-s>', ':w<CR>', silent)

  -- Tabs
  -- Unmap defaults that conflict and remap window close
  pcall(vim.keymap.del, 'n', '<C-W><C-D>')
  pcall(vim.keymap.del, 'n', '<C-W>d')
  map('i', '<C-t>', '<Esc>:tabnew<CR>i', silent)
  map('n', '<C-t>', ':tabnew<CR>', silent)
  map('i', '<C-w>', '<Esc>:Tabclose<CR>i', silent)
  map('n', '<C-w>', ':Tabclose<CR>', silent)

  -- Tab navigation Alt+1..9
  for i = 1, 9 do
    local key = string.format('<M-%d>', i)
    map('n', key, string.format(':tabn %d<CR>', i), silent)
    map('i', key, string.format('<Esc>:tabn %d<CR>i', i), silent)
    map('v', key, string.format('<Esc>:tabn %d<CR>', i), silent)
  end

  -- :Tabclose
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

-- Typing speed
  map('v', '(', 'c(<C-r>")<Esc>', { noremap = true, silent = true })
  map('v', '[', 'c[<C-r>"]<Esc>', { noremap = true, silent = true })
  map('v', '{', 'c{<C-r>"}<Esc>', { noremap = true, silent = true })
  map('v', '"', 'c"<C-r>""<Esc>', { noremap = true, silent = true })
  map('v', "'", "c'<C-r>\"'<Esc>", { noremap = true, silent = true })
  map('v', '<', '<gv', silent)
  map('v', '>', '>gv', silent)
  map('v', 's' , ':sort<cr>', silent)

-- Git
  map('n', '<leader>gB', ':GitBlame<CR>', silent)
  map('n', '<leader>gc', ':!git commit -m ""<Left>')
  map('n', '<leader>gp', ':!git pull<CR>', silent)
  map('n', '<leader>gP', ':!git push<CR>', silent)
  map('n', '<leader>gb', ':lua Snacks.picker.git_branches()<cr>', silent)

  map('n', '<leader>gd', ':DiffviewOpen<cr>', silent)
  map('n', '<leader>gD', ':DiffviewClose<cr>', silent)

-- Completado inteligente
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
-- map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

-- tmux navigator
  -- left
  map('n', '<C-g>', ':TmuxNavigateLeft<cr>', silent)
  map('i', '<C-g>', '<Esc>:TmuxNavigateLeft<cr>i', silent)

  -- up
  map('n', '<C-h>', ':TmuxNavigateUp<cr>', silent)
  map('i', '<C-h>', '<Esc>:TmuxNavigateUp<cr>', silent)

  -- right
  map('n', '<C-l>', ':TmuxNavigateRight<cr>', silent)
  map('i', '<C-l>', '<Esc>:TmuxNavigateRight<cr>i', silent)

  -- down
  map('n', '<C-c>', ':TmuxNavigateDown<cr>', silent)
  map('i', '<C-c>', '<Esc>:TmuxNavigateDown<cr>', silent)

-- Note helper
  map('n', '<leader>ng', ':GlobalNote<cr>', silent)
  map('n', '<leader>nn', ':Obsidian new<cr>', silent)
  map('n', '<leader>ns', ':Obsidian search<cr>', silent)

