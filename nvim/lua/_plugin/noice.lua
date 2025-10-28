-- plugin/noice.lua - Noice configuration

local ok, noice = pcall(require, 'noice')
if not ok then return end

noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["vim.lsp.diagnostic.on_publish_diagnostics"] = false,
    },
  },
})
