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

  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup{
        enable = true,            -- Habilitar el plugin
        max_lines = 3,            -- Máx. de líneas que puede mostrar
        trim_scope = 'outer',     -- Recorta líneas del contexto más externo
        mode = 'cursor',          -- Modo: 'cursor' o 'topline'
        separator = nil,          -- Línea separadora, ej. '─'
        zindex = 20,              -- Prioridad de render
        on_attach = nil,          -- Función opcional
      }
    end
  },
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
  --{
    ----Fijarse que esto funcione bien, en caso de error en menasjes de error, puede ser esto
    --'dense-analysis/ale',
    --lazy = false,
    --config = function()
      ---- Desactiva linters automáticos
      --vim.g.ale_linters_explicit = 1
      --vim.g.ale_fix_on_save = 0
      --vim.g.ale_completion_enabled = 0

      ---- No correr ningún linter (solo usar features de navegación)
      --vim.g.ale_linters = { cpp = {} }

      ---- Desactivar completamente los mensajes en pantalla
      --vim.g.ale_echo_cursor = 0
      --vim.g.ale_virtualtext_cursor = 0
      --vim.g.ale_virtualtext = 0
      --vim.g.ale_sign_column_always = 1

      ---- Cambiar los signos por estética (aunque no deberían mostrarse)
      --vim.fn.sign_define("ALEErrorSign", { text = "✖", texthl = "DiagnosticError" })
      --vim.fn.sign_define("ALEWarningSign", { text = "⚠", texthl = "DiagnosticWarn" })
      --vim.fn.sign_define("ALEInfoSign", { text = "ℹ", texthl = "DiagnosticInfo" })

      ---- Mapear gd para ir a definición
      ---- TODO implementarlo en maps.lua
      ----vim.api.nvim_set_keymap('n', 'gd', '<Plug>(ale_go_to_definition)', { noremap = false, silent = true })
    --end
  --},
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
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = {
        enabled = true,
        animate = { enabled = false }, -- 🚫 sin animaciones
        char = "▏",
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
      },
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
        },
        win = {
          list = {
            wo = {
              number = true,
              relativenumber = true,
            },
          },
          preview = {
            wo = {
              number = true,
              relativenumber = true,
            },
          },
        },
      },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
    --snacks setup
    config = function(_, opts)
      require("snacks").setup(opts)

      vim.schedule(function()
        vim.cmd('highlight SnacksIndentScope guifg=#373669 guibg=NONE')
      end)
    end
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
  --{ 'mhinz/vim-signify' },
  --{ 'lukas-reineke/indent-blankline.nvim',
    --main = "ibl",
    --config = function()
      --require('ibl').setup({
        --indent = {
          --char = '▏',
        --},
        --scope = {
          --enabled = true,
        --},
        --exclude = {
          --buftypes = { 'terminal' },
        --},
      --})
    --end
  --},
  { 'scrooloose/nerdcommenter' },
  { 'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require('noice').setup({
        routes = {
          filter = { event = "msg_show", kind = "confirm" },
          opts = { skip = true }, -- no duplicar el confirm
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
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
      }
      vim.schedule(function()
        vim.cmd [[
          highlight GitSignsAdd guifg=#00FF00 guibg=NONE
          highlight GitSignsChange guifg=#FFFF00 guibg=NONE
          highlight GitSignsDelete guifg=#FF0000 guibg=NONE
          highlight GitSignsAddNr guifg=#00FF00 guibg=NONE
          highlight GitSignsChangeNr guifg=#FFFF00 guibg=NONE
          highlight GitSignsDeleteNr guifg=#FF0000 guibg=NONE
          highlight GitSignsAddLn guifg=#00FF00 guibg=NONE
          highlight GitSignsChangeLn guifg=#FFFF00 guibg=NONE
          highlight GitSignsDeleteLn guifg=#FF0000 guibg=NONE
        ]]
      end)
    end
  },


  -- Utilities
  { 'tpope/vim-repeat' },
  { 'evansalter/vim-checklist' },
  { 'vim-scripts/LargeFile' },
  { 'mgedmin/chelper.vim' },
  { 'majutsushi/tagbar' },
  { 'tpope/vim-dispatch' },

  -- Windsurf integration
  { 'Exafunction/windsurf.vim' },

{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}

},
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
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    build = "make", -- necesario para fzf-native
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("coc") -- carga la extensión de coc
      telescope.setup{
        defaults = {
          -- Opciones personalizables de Telescope
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "smart" },
        }
      }
    end
  },

  -- Extensión que integra coc.nvim con Telescope
  {
    "fannheyward/telescope-coc.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
--{
  --"folke/which-key.nvim",
  --config = function()
    --require("which-key").setup {
      ---- Opciones básicas
      --plugins = {
        --spelling = { enabled = true },
      --},
      --register = {
  ---- File / Buffers
  --f = {
    --name = "Find/Files",
    --f = { ":lua Snacks.picker.files()<cr>", "Find Files" },
    --g = { ":lua Snacks.picker.lines()<cr>", "Find Lines" },
    --c = { ":lua Snacks.picker.grep()<cr>", "Grep" },
    --b = { ":lua Snacks.picker.buffers()<cr>", "Buffers" },
    --e = { ":lua Snacks.explorer()<cr>", "Explorer" },
    --r = { ":RnvimrToggle<cr>", "Ranger Toggle" },
  --},

  ---- Git
  --g = {
    --name = "Git",
    --c = { ':!git commit -m ""<Left>', "Commit" },
    --p = { ":!git pull<CR>", "Pull" },
    --P = { ":!git push<CR>", "Push" },
    --C = { ":lua Snacks.picker.git_branches()<cr>", "Checkout Branch" },
  --},

  ---- Checklist
  --c = {
    --name = "Checklist",
    --h = { ":ChecklistToggleCheckbox<cr>", "Toggle Checkbox" },
    --e = { ":ChecklistEnableCheckbox<cr>", "Enable Checkbox" },
    --d = { ":ChecklistDisableCheckbox<cr>", "Disable Checkbox" },
    --t = { ":ChecklistToggleCheckbox<cr>", "Toggle Checkbox (Visual)" },
  --},

  ---- Comments
  --cc = { "<plug>NERDCommenterToggle", "Toggle Comment" },

  ---- Obsidian
  --o = {
    --name = "Obsidian",
    --n = { ":Obsidian new<cr>", "New Note" },
    --s = { ":Obsidian search<cr>", "Search Notes" },
  --},

  ---- LSP / Code
  --f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Code" },
  --ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
--}
      ---- Puedes definir tus descripciones de teclas
      ---- por ejemplo:
      ---- ["<leader>f"] = { name = "Find" },
      ---- ["<leader>c"] = { name = "Checklist" }
    --}
  --end
--}

}
