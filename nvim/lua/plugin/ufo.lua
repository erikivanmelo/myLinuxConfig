-- plugin/ufo.lua - nvim-ufo configuration

local ok, ufo = pcall(require, 'ufo')
if not ok then return end

ufo.setup({
  fold_virt_text_handler = function(virt_text, lnum, end_lnum, width)
    local new_virt_text = {}
    local suffix = (' > %d lines '):format(end_lnum - lnum + 1)
    local suf_width = vim.fn.strlen(suffix)
    local target_width = width - suf_width

    local cur_width = 0
    for _, chunk in ipairs(virt_text) do
      local chunk_text = chunk[1]
      local chunk_width = vim.fn.strlen(chunk_text)
      if cur_width + chunk_width > target_width then
        chunk_text = '...'
        chunk_width = vim.fn.strlen(chunk_text)
      end
      table.insert(new_virt_text, { chunk_text, chunk[2] })
      cur_width = cur_width + chunk_width
    end
    table.insert(new_virt_text, { suffix, 'Comment' })
    return new_virt_text
  end,
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end,
})
