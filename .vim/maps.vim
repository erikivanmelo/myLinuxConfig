let mapleader=" "

"map <Leader>:e#<CR>z.0

map <ESC>[8~    <End>
map <ESC>[7~    <Home>
imap <ESC>[8~    <End>  
imap <ESC>[7~    <Home>

"let g:UltiSnipsExpandTrigger="<M-Enter>"

"telescope
nnoremap <leader>ff :FZF<cr>

"git
nnoremap <F1> :GitBlame<CR>
"search higlighits
nnoremap <F3> :set hlsearch!<CR>
"go to definition
nnoremap <F2> <Plug>(coc-definition)
"horizontal split
nnoremap <F4> :vsplit<CR>
inoremap <F4> <Esc>:vsplit<CR>i

"text navigation
nnoremap <M-Up> :m-2<CR>
nnoremap <M-Down> :m+<CR>
inoremap <M-Up> <Esc>:m-2<CR>i<F3>
inoremap <M-Down> <Esc>:m+<CR>i

nnoremap <PageUp> 10<Up> 
nnoremap <PageDown> 10<Down>
inoremap <PageUp> <Esc>10<Up>i
inoremap <PageDown> <Esc>10<Down>i

nnoremap <M-Left> <C-O>
nnoremap <M-Right> <C-I>

inoremap <expr> <End> coc#pum#visible()? coc#pum#confirm() : '<End>'

imap <C-BS> <C-W>

"search text
inoremap <C-f> <Esc>/
nnoremap <C-f> /
"replace text
inoremap <C-M-f> <Esc>:%s//gc
nnoremap <C-M-f> :%s//gc

"teste delete
nnoremap <C-Del> dw
nnoremap <C-Backspace> bdw


"shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff
cnoreabbrev gotod PhpactorGotoDefinition
cnoreabbrev pubi e#
cnoreabbrev nubi b#
"cnoreabbrev source ~/.vimrc reiset

"save
inoremap <C-s> <Esc>:w<CR><Right>i
nnoremap <C-s> :w<CR>

" tmux svigator
nnoremap <C-g> :TmuxNavigateLeft<cr>n
inoremap <C-g> <Esc>:TmuxNavigateLeft<cr>i
"nnoremap <C-c> :TmuxNavigateDown<cr>
"nnoremap <C-h> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
inoremap <C-l> <Esc>:TmuxNavigateRight<cr>i

" tabs and tree
nnoremap <Leader>tr :tabp<CR>
inoremap <C-w> <Esc>:q<CR>i
nnoremap <C-w> :q<CR>
inoremap <C-t> <Esc>:tabnew<CR>i
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>ts :tabn<cr>
nnoremap <Leader>tt :NERDTreeToggle<cr>

nnoremap <M-1> :tabn 1<cr>
nnoremap <M-2> :tabn 2<cr>
nnoremap <M-3> :tabn 3<cr>
nnoremap <M-4> :tabn 4<cr>
nnoremap <M-5> :tabn 5<cr>
nnoremap <M-6> :tabn 6<cr>
nnoremap <M-7> :tabn 7<cr>
nnoremap <M-8> :tabn 8<cr>
nnoremap <M-9> :tabn 9<cr>

nnoremap <Leader>b :Buffers<cr>

nnoremap <Leader><C-t> :new tab<cr>
nnoremap <Leader><C-w> :tab close<cr>

nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>

" remove with backspace
nnoremap <Backspace> X

" DiffViewOpen
nnoremap <F6> :DiffviewOpen<cr>
inoremap <F6> <Esc>:DiffviewOpen<cr>


"toggles
"nnoremap tt :tree<cr>
