syntax on

if has('nvim')
  " plugins handled by lazy.nvim (see nvim/init.lua)
else
  so ~/.vim/plugins.vim
endif
if has('nvim')
  lua require('maps')
else
  so ~/.vim/maps.vim
endif

 
" Default mapping (migrated to Lua)
 

 

      "  nerdtree
 
"let NERDTreeMapOpenInTab='<CR>'
"let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
 

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Enable and configure nvim-web-devicons
 

 


"config vimspector (migrated to Lua)
 

" Habilita treesitter con Lua
" 

 

 

 
