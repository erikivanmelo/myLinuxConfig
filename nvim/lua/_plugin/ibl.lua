-- plugin/ibl.lua - Indent Blankline (ibl) configuration

local ok, ibl = pcall(require, 'ibl')
if not ok then return end

ibl.setup({
  indent = {
    char = '▏',
  },
  scope = {
    enabled = true,
  },
  exclude = {
    buftypes = { 'terminal' },
  },
})

-- Optional highlight customization is in ui.lua (IblScope)
