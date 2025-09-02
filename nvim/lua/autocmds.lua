-- autocmds.lua - Migrated autocmds from vimrc
local api, fn = vim.api, vim.fn

-- Restore last cursor position when opening a file
api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, { mark[1], mark[2] })
    end
  end,
})

-- Write ShaDa on leaving a buffer (similar to :wshada)
api.nvim_create_autocmd('BufLeave', {
  callback = function()
    pcall(vim.cmd, 'wshada')
  end,
})

-- Enable Signify if available on VimEnter
api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if fn.exists(':SignifyEnable') == 2 then
      pcall(vim.cmd, 'SignifyEnable')
    end
  end,
})
