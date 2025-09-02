-- ui.lua - Colorscheme and highlight groups

local api = vim.api

-- Apply colorscheme (ensure plugin is loaded early)
local ok, err = pcall(function()
  vim.cmd.colorscheme('gruvbox')
end)
if not ok then
  vim.schedule(function()
    vim.notify('ui.lua: colorscheme gruvbox not applied: ' .. tostring(err), vim.log.levels.WARN)
  end)
end

-- Highlights migrated from vimrc
-- Visual selection: blue background, default foreground
api.nvim_set_hl(0, 'Visual', { bg = '#0000ff' })

-- Normal background transparent
api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })

-- Split line color
api.nvim_set_hl(0, 'VertSplit', { fg = '#2e2e2e' })

-- Indent Blankline scope color
api.nvim_set_hl(0, 'IblScope', { fg = '#74547d', bg = 'NONE' })
