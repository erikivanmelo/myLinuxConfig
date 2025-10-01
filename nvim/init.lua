-- Neovim init.lua that simply sources your existing ~/.vimrc
-- This allows you to keep using your Vim configuration in Neovim.

-- 1) Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2) Load plugins (spec at nvim/lua/plugins.lua)
pcall(function()
  require('lazy').setup(require('plugins'))
end)

-- 3) Load Lua options
pcall(function()
  require('options')
end)

-- 4) Load Lua globals (migration of Vimscript `let`)
pcall(function()
  require('globals')
end)


-- 5) Load UI (colorscheme and highlights)
pcall(function()
  require('ui')
end)

-- 6) Load plugin configs
pcall(function()
  require('plugin.ibl')
  require('plugin.noice')
  require('plugin.treesitter')
  require('plugin.ufo')
end)

-- Load keymaps
pcall(function()
  require('maps')
end)

-- 7) Load autocmds
pcall(function()
  require('autocmds')
end)
