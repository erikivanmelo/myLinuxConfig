let mapleader=" "

map <ESC>[8~    <End>
map <ESC>[7~    <Home>
imap <ESC>[8~    <End>  
imap <ESC>[7~    <Home>

"git
nnoremap <silent> <F1> :GitBlame<CR>
inoremap <silent> <F1> <Right><Esc>:GitBlame<CR>i
nnoremap gc   :!git commit -m ""<left>
nnoremap ga   :!git add
nnoremap <silent> gp   :!git pull<cr>
nnoremap <silent> gP   :!git push<cr>
nnoremap gC	  :!git checkout
nnoremap gm	  :!git merge
nnoremap <silent> gg   :diffget<cr>
nnoremap <silent> gG   :diffput<cr>
nnoremap <silent> <F6> :DiffviewOpen<cr>
inoremap <silent> <F6> <Esc>:DiffviewOpen<cr>
nnoremap <silent> <leader><F6> :DiffviewClose<cr>

"go to definition
inoremap <silent> <F2> <Esc><Plug>(coc-definition)<Esc>i
nnoremap <silent> <F2> <Plug>(coc-definition)

"horizontal split
nnoremap <silent> <F4> :vsplit<CR>
inoremap <silent> <F4> <Esc>:vsplit<CR>i

"text navigation
nnoremap <silent> <M-Up> :m-2<CR>
nnoremap <silent> <M-Down> :m+<CR>
inoremap <silent> <M-Up> <Esc>:m-2<CR>i<Right>
inoremap <silent> <M-Down> <Esc>:m+<CR>i<Right>

vnoremap <silent> <PageUp> 10<Up> 
vnoremap <silent> <PageDown> 10<Down> 

nnoremap <silent> <PageUp> 10<Up>
nnoremap <silent> <PageDown> 10<Down>

inoremap <silent> <PageUp> <Esc>10<Up>i
inoremap <silent> <PageDown> <Esc>10<Down>i

nnoremap <silent> <M-Left> <C-O>
nnoremap <silent> <M-Right> <C-I>

nnoremap <silent> <C-Home> gg
nnoremap <silent> <C-End> G

inoremap <silent> <expr> <End> coc#pum#visible()? coc#pum#confirm() : '<End>'

"search
nnoremap <silent> <leader>ff :FZF<cr>

nnoremap <silent> <leader>fc :Rg<cr>

nnoremap <silent> <leader>fg :BLines<cr>
vnoremap <silent> <leader>fg y:BLines<cr><C-S-V>

inoremap <C-f> <Esc>/
nnoremap <C-f> /
vnoremap <C-f> y/<C-R>"
vnoremap / y/<C-R>"

nnoremap <silent> <F3> :set hlsearch!<CR>
inoremap <silent> <F3> <Esc>:set hlsearch!<CR>i<Right>

nnoremap <silent> <leader>nr :set relativenumber!<CR>

"replace text
inoremap <C-M-f> <Esc>:%s///gc<Left><Left><Left><Left>
nnoremap <C-M-f> :%s///gc<Left><Left><Left><Left>
vnoremap <C-M-f> y:%s/<C-R>"//gc<Left><Left><Left>


"delete
nnoremap <silent> <C-Del> dw
nnoremap <silent> <C-Backspace> bdw
vnoremap <silent> <Del> "_d
nnoremap <silent> <Del> "_<Del>
nnoremap <silent> <Backspace> X

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
inoremap <silent> <C-s> <Esc>:W<CR>
nnoremap <silent> <C-s> :W<CR>

" tmux svigator
nnoremap <silent> <C-g> :TmuxNavigateLeft<cr>
inoremap <silent> <C-g> <Esc>:TmuxNavigateLeft<cr>i

nnoremap <silent> <C-c> :TmuxNavigateDown<cr>

nnoremap <silent> <C-h> :TmuxNavigateUp<cr>

nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
inoremap <silent> <C-l> <Esc>:TmuxNavigateRight<cr>i

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


unmap <C-W><C-D>
unmap <C-W>d

inoremap <silent> <C-w> <Esc>:Tabclose<CR>i
nnoremap <silent> <C-w> :Tabclose<CR>

" tabs and tree
nnoremap <silent> <Leader>tr :tabp<CR>
inoremap <silent> <C-t> <Esc>:tabnew<CR>i
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <Leader>ts :tabn<cr>
nnoremap <silent> <F7> :NERDTreeToggle<cr>
inoremap <silent> <F7> <Esc>:NERDTreeToggle<cr>
nnoremap <silent> ff :RnvimrToggle<cr>

" tab navigation
for i in range(1, 9)
	let key = "\<M-".i.">"
	execute 'nnoremap <silent> ' . key . ' :tabn '.i.'<CR>'
	execute 'inoremap <silent> ' . key . ' <Esc>:tabn '.i.'<CR>i'
	execute 'vnoremap <silent> ' . key . ' <Esc>:tabn '.i.'<CR>'
endfor

nnoremap <silent> <Leader>b :Buffers<cr>

nnoremap <silent> <Leader><C-t> :new tab<cr>
nnoremap <silent> <Leader><C-w> :bd<cr>

" checklist
nnoremap <silent> <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <silent> <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <silent> <leader>cd :ChecklistDisableCheckbox<cr>

vnoremap <silent> <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <silent> <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <silent> <leader>cd :ChecklistDisableCheckbox<cr>

inoremap <silent> <C-D> <C-W>
" Seleccionar todo el archivo
nnoremap <silent> <C-a> ggVG

" others
nnoremap <silent> <F12> i
vnoremap <silent> <F12> <Esc>
inoremap <silent> <F12> <Right><Esc>

nnoremap <silent> <leader>cc <plug>NERDCommenterToggle
vnoremap <silent> <leader>cc <plug>NERDCommenterToggle

nnoremap <silent> <F5> :e<CR>
inoremap <silent> <F5> i:e<CR><right>i

nnoremap <silent> qq :q!<CR> 

" unmap <C-u>
nnoremap <silent> <C-u> <C-r>

 "nnoremap <silent> <C-b> :g/.*\n^{/yank A<cr>:bn<cr>pkdd:%s/$/;/<cr>:g/::/d B<cr>A<cr><cr>class <cr>{<cr>};<esc>"BP:%s/[^ ]\+:://<cr>j%jyt(kk$p=ipjA<cr>public:<esc>
