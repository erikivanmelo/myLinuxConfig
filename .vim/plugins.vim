call plug#begin('~/.vim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" files managment
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/plenary.nvim'

" typing
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bmewburn/intelephense-docs'
"Plug 'LucHermitte/lh-cpp'

" test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'
Plug 'vim-syntastic/syntastic'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'sindrets/diffview.nvim'

" rastreo
Plug 'wakatime/vim-wakatime'

"speed
Plug 'lewis6991/impatient.nvim'
Plug 'unblevable/quick-scope'

"icons
Plug 'nvim-tree/nvim-web-devicons'

" git
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'idanarye/vim-merginal'
Plug 'itchyny/vim-gitbranch'

Plug 'tpope/vim-repeat'

Plug 'evansalter/vim-checklist'

call plug#end()
