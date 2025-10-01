-- plugins.lua - lazy.nvim plugin specification
-- Migrated from ~/.vim/plugins.vim

return {
  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true, opts = { default = true } },

  -- Syntax / colors / treesitter
  { 
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end 
  },
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
        refactor = { 
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = true },
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
    },
  },
  { 'nvim-treesitter/nvim-treesitter-refactor' },

  -- Folding
  { 'kevinhwang91/promise-async' },
  { 'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup({})
    end,
  },
  { 'kevinhwang91/promise-async' },

  -- Status bar / Theme / Lint
  { 'dense-analysis/ale' },
  { 'morhetz/gruvbox', lazy = false, priority = 1000 },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'gruvbox',
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } } },
          lualine_c = { { 'filename', path = 1, symbols = { modified = ' [+]' } } },
          lualine_x = { 'encoding', 'filetype', 'filesize' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {}, lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' }, lualine_y = {}, lualine_z = {},
        },
      })
    end
  },

  -- Files management
  { 'kevinhwang91/rnvimr' },
  { 'chipsenkbeil/distant.nvim',
    config = function() require('distant'):setup() end
  },
  { 'folke/snacks.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = {
        enabled = true,
        matcher = {
          sort_empty = true
        },
        sources = {
            explorer = {
                ignored = true,
                hidden = true,
                pinned = true,
            },
            files = {
                ignored = false,
                hidden = true
            },
            grep = {
                ignored = false,
                hidden = true
            }
        }
    },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
    },
  -- Typing
  { 'alvan/vim-closetag' },
  { 'tpope/vim-surround' },

  -- Tmux
  { 'benmills/vimux' },
  { 'christoomey/vim-tmux-navigator' },

  -- Autocomplete / snippets / LSP / Mason
  {'sirver/ultisnips'}, -- Motor de snippets para facilitar la escritura de código.
  { 'neoclide/coc.nvim' },  -- Completado automático avanzado y más para múltiples lenguajes.

  -- IDE / UI
  { 'editorconfig/editorconfig-vim' },
  { 'mg979/vim-visual-multi' },
  { 'mhinz/vim-signify' },
  { 'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup({
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
    end
  },
  { 'scrooloose/nerdcommenter' },
  { 'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require('noice').setup({
          routes = {
    {
      filter = { event = "msg_show", kind = "confirm" },
      opts = { skip = true }, -- no duplicar el confirm
    },
  },
      })
    end
  },
  { 'MunifTanjim/nui.nvim' },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = { 
            numbers = "none", 
            show_tab_indicators = false,
                    mode = "tabs"
                }
      })
    end
  },

  -- Tracking / misc
  { 'wakatime/vim-wakatime' },
  { 'kshenoy/vim-signature' },
  { 'tpope/vim-abolish' },
  { 'xiyaowong/transparent.nvim',
        config = function()
            require('transparent').setup({
  extra_groups = {
    "TelescopeBorder",  -- borde de Telescope
    "TelescopeNormal",  -- fondo de Telescope
    "NormalFloat",      -- ventanas flotantes genéricas
    "FloatBorder"       -- borde de flotantes
  },
            })
        end
    },
  { 'lewis6991/impatient.nvim' },

  -- Git
  { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'zivyangll/git-blame.vim' },
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

  { "folke/todo-comments.nvim" },
  { "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      enabled = true,
      sign = true,
      style = "full",
      icons = { "① ", "② ", "③ ", "④ ", "⑤ ", "⑥ " },
      left_pad = 1,
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      right_pad = 1,
      highlight = "render-markdownBullet",
    },
  },
},

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    enabled = function()
      -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
      return not vim.g.disable_obsidian
    end,
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "DaiNotes", -- Name of the workspace
          path = os.getenv("HOME") .. "/Documents/Obsidian Vault/limbo", -- Path to the notes directory
        },
      },
      note_id_func = function(title)
        -- Obtener timestamp o ID base
        local id_base = os.time()  -- mantiene parte única
        -- Normalizar el título para usar como sufijo
        local suffix = title:gsub("[^%w]", "-")  -- reemplaza caracteres inválidos por guiones
        return id_base .. "-" .. suffix
      end,
      completition = {
        cmp = true,
      },
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
        name = "snacks.pick",
      },
      -- Optional, define your own callbacks to further customize behavior.
      callbacks = {
        -- Runs anytime you enter the buffer for a note.
        enter_note = function(client, note)
          -- Setup keymaps for obsidian notes
          vim.keymap.set("n", "gf", function()
            return require("obsidian").util.gf_passthrough()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

          vim.keymap.set("n", "<leader>ch", function()
            return require("obsidian").util.toggle_checkbox()
          end, { buffer = note.bufnr, desc = "Toggle checkbox" })

          vim.keymap.set("n", "<cr>", function()
            return require("obsidian").util.smart_action()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
        end,
      },

      -- Settings for templates
      templates = {
        subdir = "templates", -- Subdirectory for templates
        date_format = "%Y-%m-%d-%a", -- Date format for templates
        gtime_format = "%H:%M", -- Time format for templates
        tags = "", -- Default tags for templates
      },
    },
  },

{
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      -- acá ya tenés opciones como sources, snippet, window, etc
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<End>"] = cmp.mapping.confirm({ select = true }),
        -- otros mapeos...
      }),
    })
  end,
}

}
