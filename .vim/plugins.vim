call plug#begin('~/.vim/plugged')

" icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons'         " Agrega iconos a la vista del árbol de archivos.

" syntax
Plug 'sheerun/vim-polyglot'                 " Mejora la resaltación de sintaxis para una variedad de lenguajes.
Plug 'norcalli/nvim-colorizer.lua'          " Resalta los códigos de color en tiempo real en tus archivos.

" status bar
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'               " Barra de estado personalizable y extensible.
Plug 'morhetz/gruvbox'                     " Tema popular para Neovim.
Plug 'shinchu/lightline-gruvbox.vim'       " Tema de barra de estado que combina con Gruvbox.

" files management
Plug 'scrooloose/nerdtree'                 " Gestión de archivos y directorios en un árbol de navegación.
Plug 'nvim-lua/plenary.nvim'               " Dependencia para plugins de Lua.

" typing
Plug 'alvan/vim-closetag'                 " Cierra automáticamente etiquetas HTML y XML.
Plug 'tpope/vim-surround'                 " Facilita la manipulación de pares de caracteres (por ejemplo, comillas).

" tmux
Plug 'benmills/vimux'                     " Integración con Tmux para enviar comandos entre Neovim y Tmux.
Plug 'christoomey/vim-tmux-navigator'     " Navegación más sencilla entre ventanas de Tmux y Neovim.

" autocomplete
Plug 'sirver/ultisnips'                   " Motor de snippets para facilitar la escritura de código.
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Completado automático avanzado y más para múltiples lenguajes.
Plug 'bmewburn/intelephense-docs'         " Documentación para el servidor Intelephense (PHP).

" test
"Plug 'vim-syntastic/syntastic'           " Verificación de sintaxis y linter para varios lenguajes.

" IDE
Plug 'editorconfig/editorconfig-vim'       " Soporte para archivos de configuración .editorconfig.
Plug 'junegunn/fzf'                        " Búsqueda rápida y filtrado de archivos y directorios.
Plug 'junegunn/fzf.vim'                    " Integración de FZF con Neovim.
Plug 'terryma/vim-multiple-cursors'        " Selección y edición simultánea de múltiples instancias de texto.
Plug 'mhinz/vim-signify'                   " Muestra los cambios Git en el margen.
Plug 'yggdroot/indentline'                 " Muestra líneas verticales de indentación.
Plug 'scrooloose/nerdcommenter'            " Comentado y descomentado rápido de código.

" rastreo
Plug 'wakatime/vim-wakatime'               " Seguimiento del tiempo que pasas en proyectos de desarrollo.

" speed
Plug 'lewis6991/impatient.nvim'            " Carga más rápida de Neovim al abrir archivos grandes.

Plug 'neovim/nvim-lspconfig'

" git
Plug 'sindrets/diffview.nvim'              " Visualización de diferencias Git.
Plug 'zivyangll/git-blame.vim'            " Muestra el autor de la última modificación en la línea actual.
Plug 'idanarye/vim-merginal'              " Interfaz de fusión de conflictos Git.
Plug 'itchyny/vim-gitbranch'              " Muestra la rama Git actual en la barra de estado.

Plug 'tpope/vim-repeat'                    " Extiende el soporte de repetición de comandos.
Plug 'evansalter/vim-checklist'            " Marca tareas pendientes y las muestra en una lista.
Plug 'vim-scripts/LargeFile'               " Resalta archivos grandes.
Plug 'mgedmin/chelper.vim'                " Soporte para programas en C y C++.
Plug 'majutsushi/tagbar'                  " Visualización de estructura de código con etiquetas.

" Debuggin
" Plug 'puremourning/vimspector'            " Depurador para Neovim.

Plug 'tpope/vim-dispatch'

call plug#end()
