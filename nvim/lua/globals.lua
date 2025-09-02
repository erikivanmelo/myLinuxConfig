-- globals.lua - Migration of Vimscript `let` assignments to Lua
-- Sets plugin globals and environment variables

local g = vim.g
local env = vim.env

-- rnvimr
g.rnvimr_enable_ex = 1
g.rnvimr_enable_picker = 1

-- Python host
g.python3_host_prog = '/usr/bin/python3'

-- C/C++ compiler flags
g.cpp_compiler_options = '-std=c++17'
env.CXXFLAGS = g.cpp_compiler_options

-- visual-multi / multiple cursors legacy keys (kept for compatibility)
g.multi_cursor_start_word_key      = '<C-n>'
g.multi_cursor_select_all_word_key = '<A-n>'
g.multi_cursor_start_key           = 'g<C-n>'
g.multi_cursor_select_all_key      = 'g<A-n>'
g.multi_cursor_next_key            = '<C-n>'
g.multi_cursor_prev_key            = '<C-p>'
g.multi_cursor_skip_key            = '<C-x>'
g.multi_cursor_quit_key            = '<Esc>'

-- lightline configuration (converted dict to Lua table)
g.lightline = {
  colorscheme = 'gruvbox',
  active = {
    left = {
      { 'mode', 'paste' },
      {},
      { 'relativepath', 'modified' },
    },
    right = {
      { 'kitestatus' },
      { 'gitbranch', 'filetype', 'filesize', 'percent', 'lineinfo' },
    },
  },
  inactive = {
    left = {
      { 'inactive' },
      { 'relativepath' },
    },
    right = {
      { 'bufnum' },
    },
  },
  component = {
    bufnum = '%n',
    inactive = 'inactive',
    filesize = '%{FileSize()}',
  },
  component_function = {
    gitbranch = 'gitbranch#name',
  },
  subseparator = {
    left = '',
    right = '',
  },
}

-- NERDTree
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeShowLineNumbers = 1

-- NERDTree tabs integration
g.nerdtree_tabs_open_on_new_tab = 1

-- Gruvbox
g.gruvbox_conntrast_dark = 'hard'

-- Airline Tagbar extension
g['airline#extensions#tagbar#enabled'] = 1
g['airline#extensions#tagbar#flags'] = ''

-- ALE
g.ale_sign_column_always = 1
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'

-- Vimspector
g.vimspector_enable_mappings = 'HUMAN'
g.vimspector_install_gadgets = { ['enable-terminal'] = 0 }
