" lightline-filesize.vim - Provide FileSize() for lightline component

if exists('*FileSize')
  finish
endif

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
