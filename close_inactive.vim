" Delete all inactive buffers by running:
" :call CloseInactiveBuffers()
" or the 
" :CloseInactiveBufers
command! -nargs=* CloseInactiveBuffers call CloseInactiveBuffers()
function! CloseInactiveBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that's loaded and not visible
  for b in range(1, bufnr('$'))
    " if bufloaded(b) && !has_key(visible, b)
    if buflisted(b) && !has_key(visible, b) && !getbufvar(b, "&mod")
      exe 'bd ' . b
    endif
  endfor
endfun

" reference: http://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
