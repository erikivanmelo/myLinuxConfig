let mapleader=" "

map <ESC>[8~    <End>
map <ESC>[7~    <Home>
imap <ESC>[8~    <End>  
imap <ESC>[7~    <Home>

"git
nnoremap <F1> :GitBlame<CR>
inoremap <F1> <Right><Esc>:GitBlame<CR>i
nnoremap gc   :!git commit -m ""<left>
nnoremap ga   :!git add
nnoremap gp   :!git pull<cr>
nnoremap gP   :!git push<cr>
nnoremap gC	  :!git checkout
nnoremap gm	  :!git merge
nnoremap <F6> :DiffviewOpen<cr>
inoremap <F6> <Esc>:DiffviewOpen<cr>
nnoremap <leader><F6> :DiffviewClose<cr>

"go to definition
inoremap <F2> <Esc><Plug>(coc-definition)<Esc>i
nnoremap <F2> <Plug>(coc-definition)

"horizontal split
nnoremap <F4> :vsplit<CR>
inoremap <F4> <Esc>:vsplit<CR>i

"text navigation
nnoremap <M-Up> :m-2<CR>
nnoremap <M-Down> :m+<CR>
inoremap <M-Up> <Esc>:m-2<CR>i<Right>
inoremap <M-Down> <Esc>:m+<CR>i<Right>

vnoremap <PageUp> 10<Up> 
vnoremap <PageDown> 10<Down> 

nnoremap <PageUp> 10<Up>
nnoremap <PageDown> 10<Down>

inoremap <PageUp> <Esc>10<Up>i
inoremap <PageDown> <Esc>10<Down>i

nnoremap <M-Left> <C-O>
nnoremap <M-Right> <C-I>

nnoremap <C-Home> gg
nnoremap <C-End> G

inoremap <expr> <End> coc#pum#visible()? coc#pum#confirm() : '<End>'

"search
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fc :Rg<cr>
nnoremap <leader>fg :BLines<cr>

inoremap <C-f> <Esc>/
nnoremap <C-f> /
vnoremap <C-f> y/<C-R>"
vnoremap / y/<C-R>"

nnoremap <F3> :set hlsearch!<CR>
inoremap <F3> <Esc>:set hlsearch!<CR>i<Right>

"replace text
inoremap <C-M-f> <Esc>:%s///gc<Left><Left><Left><Left>
nnoremap <C-M-f> :%s///gc<Left><Left><Left><Left>
vnoremap <C-M-f> y:%s/<C-R>"//gc<Left><Left><Left>

"delete
nnoremap <C-Del> dw
nnoremap <C-Backspace> bdw
vnoremap <Del> "_d
nnoremap <Del> "_<Del>
nnoremap <Backspace> X

command! W call W()
function! W()
	if filereadable(expand('%:p'))
		w
	else
		let nuevo_nombre = input('Filename: ')
		if nuevo_nombre != ''
			execute 'write ' . nuevo_nombre
		endif
	endif
endfunction

"save
inoremap <C-s> <Esc>:W<CR>
nnoremap <C-s> :W<CR>

" tmux svigator
nnoremap <C-g> :TmuxNavigateLeft<cr>
inoremap <C-g> <Esc>:TmuxNavigateLeft<cr>i
"nnoremap <C-c> :TmuxNavigateDown<cr>
"nnoremap <C-h> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
inoremap <C-l> <Esc>:TmuxNavigateRight<cr>i

command! Tabclose call TabClose()
function! TabClose()
	" Si el buffer está abierto solo una vez, ciérralo con :bd
	if len(win_findbuf(bufnr("%"))) > 1
		q
		return
	endif

	if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 && getline(1,'$') == ['']
		q!
	else
		bd
	endif
endfunction

inoremap <C-w> <Esc>:Tabclose<CR>i
nnoremap <C-w> :Tabclose<CR>

" tabs and tree
nnoremap <Leader>tr :tabp<CR>
inoremap <C-t> <Esc>:tabnew<CR>i
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>ts :tabn<cr>
nnoremap <F7> :NERDTreeToggle<cr>
inoremap <F7> <Esc>:NERDTreeToggle<cr>

" tab navigation
for i in range(1, 9)
	let key = "\<M-".i.">"
	execute 'nnoremap ' . key . ' :tabn '.i.'<CR>'
	execute 'inoremap ' . key . ' <Esc>:tabn '.i.'<CR>i'
	execute 'vnoremap ' . key . ' <Esc>:tabn '.i.'<CR>'
endfor

nnoremap <Leader>b :Buffers<cr>

nnoremap <Leader><C-t> :new tab<cr>
nnoremap <Leader><C-w> :bd<cr>

" checklist
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>

vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>

inoremap <C-D> <C-W>

" Seleccionar todo el archivo
nnoremap <C-a> ggVG

" others
nnoremap <F12> i
vnoremap <F12> <Esc>
inoremap <F12> <Right><Esc>

nnoremap <F11> <plug>NERDCommenterToggle
vnoremap <F11> <plug>NERDCommenterToggle
inoremap <F11> <Esc><plug>NERDCommenterToggle i

nnoremap <F5> :e<CR>
inoremap <F5> i:e<CR><right>i

nnoremap qq :q!<CR> 

" nnoremap <C-b> :g/.*\n^{/yank A<cr>:bn<cr>pkdd:%s/$/;/<cr>:g/::/d B<cr>A<cr><cr>class <cr>{<cr>};<esc>"BP:%s/[^ ]\+:://<cr>j%jyt(kk$p=ipjA<cr>public:<esc>
