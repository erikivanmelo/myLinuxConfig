-- plugins.lua - lazy.nvim plugin specification
-- Migrated from ~/.vim/plugins.vim

return {
  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true, opts = { default = true } },

  -- Syntax / colors / treesitter
  { 'sheerun/vim-polyglot' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/nvim-treesitter-refactor' },

  -- Folding
  { 'kevinhwang91/promise-async' },
  { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async' } },

  -- Status bar / Lint / Theme
  { 'dense-analysis/ale' },
  { 'itchyny/lightline.vim' },
  { 'morhetz/gruvbox', lazy = false, priority = 1000 },
  { 'shinchu/lightline-gruvbox.vim' },

  -- Files management
  { 'scrooloose/nerdtree' },
  { 'nvim-lua/plenary.nvim' },
  { 'kevinhwang91/rnvimr' },
  { 'chipsenkbeil/distant.nvim' },

  -- Typing
  { 'alvan/vim-closetag' },
  { 'tpope/vim-surround' },

  -- Tmux
  { 'benmills/vimux' },
  { 'christoomey/vim-tmux-navigator' },

  -- Autocomplete / snippets / LSP helpers
  { 'sirver/ultisnips' },
  { 'neoclide/coc.nvim', branch = 'release' },
  { 'bmewburn/intelephense-docs' },

  -- IDE / UI
  { 'editorconfig/editorconfig-vim' },
  { 'junegunn/fzf', build = function()
      local install = vim.fn.stdpath('data') .. '/lazy/fzf/install'
      if vim.fn.executable(install) == 1 then
        vim.fn.system({ install, '--bin' })
      elseif vim.fn.executable('bash') == 1 then
        vim.fn.system({ 'bash', 'install', '--bin' })
      end
    end
  },
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
  { 'mg979/vim-visual-multi' },
  { 'mhinz/vim-signify' },
  { 'lukas-reineke/indent-blankline.nvim' }, -- v3 provides module "ibl"
  { 'scrooloose/nerdcommenter' },
  { 'folke/noice.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
  { 'MunifTanjim/nui.nvim' },

  -- Tracking / misc
  { 'wakatime/vim-wakatime' },
  { 'kshenoy/vim-signature' },
  { 'tpope/vim-abolish' },
  { 'xiyaowong/transparent.nvim' },
  { 'lewis6991/impatient.nvim' },

  -- LSP / Mason
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim', dependencies = { 'williamboman/mason.nvim' } },

  -- Git
  { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'zivyangll/git-blame.vim' },
  { 'idanarye/vim-merginal' },
  { 'itchyny/vim-gitbranch' },

  -- Utilities
  { 'tpope/vim-repeat' },
  { 'evansalter/vim-checklist' },
  { 'vim-scripts/LargeFile' },
  { 'mgedmin/chelper.vim' },
  { 'majutsushi/tagbar' },
  { 'tpope/vim-dispatch' },

  -- Windsurf integration
  { 'Exafunction/windsurf.vim' },

  -- Completion framework (not wired here, present for future)
  { 'hrsh7th/nvim-cmp' },
}
