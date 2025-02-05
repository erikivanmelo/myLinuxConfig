syntax on

so ~/.vim/plugins.vim
so ~/.vim/maps.vim

set number
set relativenumber
set mouse=a
set numberwidth=1
" sicroniza portapapeles con el sistema
set clipboard=unnamedplus
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors
set sw=2
set ignorecase
" Autoload de files with changes
set autoread
set tags=./tags,tags;$HOME
set noincsearch

let g:python3_host_prog = '/usr/bin/python3'
let g:cpp_compiler_options = '-std=c++17'

" Establece las opciones de compilación.
let $CXXFLAGS = g:cpp_compiler_options

" Guarda la ultima posicion del buffer, para que cuanodo vuelvas no quedes al principio
autocmd BufEnter * silent! normal! g`"
" Guarda la ulitam posicion del buffer, para cuando vuelval a ingresar al archivo
autocmd BufLeave * :wshada

autocmd VimEnter * :SignifyEnable

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


function! FileSize()
    let file_size = line2byte(line('$'))
    if file_size < 1024
        return file_size . 'B'
    elseif file_size < 1048576
        return (file_size / 1024) . 'KB'
    else
        return (file_size / 1048576) . 'MB'
    endif
endfunction

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
        \ 'left': [
            \ ['mode', 'paste'],
            \ [],
            \ ['relativepath', 'tagbar', 'modified']
        \ ],
        \ 'right': [
            \ ['kitestatus'],
            \ ['gitbranch', 'filetype', 'filesize', 'percent', 'lineinfo']
        \ ]
    \ },
    \ 'inactive': {
        \ 'left': [
            \ ['inactive'],
            \ ['relativepath']
        \ ],
        \ 'right': [
            \ ['bufnum']
        \ ]
    \ },
    \ 'component': {
        \ 'bufnum': '%n',
        \ 'inactive': 'inactive',
        \ 'tagbar': '%{substitute(tagbar#currenttag("%s", "", "f"), "\\", ":", "g")}',
        \ 'filesize': '%{FileSize()}',
    \ },
    \ 'component_function': {
        \ 'gitbranch': 'gitbranch#name'
    \ },
    \ 'subseparator': {
        \ 'left': '',  
        \ 'right': ''  
    \ }
\ }

      "  nerdtree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
"let NERDTreeMapOpenInTab='<CR>'
"let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
let g:nerdtree_tabs_open_on_new_tab = 1

colorscheme gruvbox
let g:gruvbox_conntrast_dark = "hard"

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''


highlight Normal ctermbg=NONE
set laststatus=2
set noshowmode

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Enable and configure nvim-web-devicons
lua require'nvim-web-devicons'.setup {
            \    default = true;
            \}

let g:ale_sign_column_always = 1

" Configure Ale to use devicons
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


"config vimspector 
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = {'enable-terminal': 0}

" Habilita treesitter con Lua
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
}

EOF

lua << EOF
-- Configuración básica de nvim-ufo
    require('ufo').setup({
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, width)
        local new_virt_text = {}
        -- Cambié el formato para que sea más estilizado y limpio
        local suffix = (' > %d lines '):format(end_lnum - lnum + 1)  -- Cambié el texto para algo más claro y conciso
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
          table.insert(new_virt_text, {chunk_text, chunk[2]})
          cur_width = cur_width + chunk_width
        end
        -- Cambié el color de la etiqueta del sufijo a 'Comment' para que sea más suave visualmente
        table.insert(new_virt_text, {suffix, 'Comment'})
        return new_virt_text
      end,
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })

-- Configuración para la versión 3 de indent-blankline.nvim
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

lua << EOF
-- Definición de los colores de los grupos de resaltado

-- Opcional: configurar los bordes para que se vea mejor la indentación
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#2e2e2e" })  -- Color de la línea de separación entre ventanas
vim.api.nvim_set_hl(0, "IblScope", { fg = "#74547d", bg = "none" })
require("ibl").setup({

  indent = {
    char = "▏",
  },

  -- Configuración del contexto (resaltar la indentación donde está el cursor)
  scope = {
    enabled = true,  -- Habilitar el resaltado del contexto actual
  },

  -- Configuración de archivos y tipos de búfer a excluir
  exclude = {
    buftypes = { "terminal" },  -- Excluir búferes de terminal
  },
})


-- Configuración de indentación automática en Neovim
vim.cmd([[
  " Ajustes de indentación
  set tabstop=4         " Número de espacios representados por un tab
  set softtabstop=4     " Cuántos espacios se usan cuando presionas Tab o Backspace
  set shiftwidth=4      " Número de espacios para un nivel de indentación
  set expandtab         " Usa espacios en lugar de tabuladores (cuando se presiona Tab)
  set smarttab          " Mueve el cursor correctamente al presionar Tab

  " Configurar que, al insertar, se mueva de 4 en 4 espacios si hay 4 espacios consecutivos
  set smartindent       " Activa la indentación inteligente
  set autoindent        " Activa la indentación automática
  set cinoptions+=L0    " Permite que Neovim mueva el cursor de 4 en 4 en función de la indentación

  " Detecta automáticamente el tamaño de tabulación del archivo
  filetype plugin indent on
]])


EOF
