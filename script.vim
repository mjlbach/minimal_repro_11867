function! s:deletelines(start, end) abort
    silent! execute a:start . ',' . a:end . 'delete _'
endfunction

let lines_after = getbufline(bufnr('%'), 104, '$')
let lines_before = getbufline(bufnr('%'), 1, 99)
let new_buffer = lines_before + ['whatever'] + lines_after
call s:deletelines(len(new_buffer), line('$'))
call setline(1, new_buffer)
