syntax on

so ~/.vim/maps.vim
so ~/.vim/plugins.vim

set number
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
set relativenumber
set ignorecase
" Autoload de files with changes
set autoread
set tags=./tags,tags;$HOME
set noincsearch

let g:cpp_compiler_options = '-std=c++17'

" Establece las opciones de compilación.
let $CXXFLAGS = g:cpp_compiler_options

" Guarda la ultima posicion del buffer, para que cuanodo vuelvas no quedes al principio
autocmd BufEnter * silent! normal! g`"
" Guarda la ulitam posicion del buffer, para cuando vuelval a ingresar al archivo
autocmd BufLeave * :wshada

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
