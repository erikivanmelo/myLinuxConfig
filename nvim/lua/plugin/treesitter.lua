-- plugin/treesitter.lua - nvim-treesitter configuration

local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

ts_configs.setup({
  highlight = { enable = true },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
})
