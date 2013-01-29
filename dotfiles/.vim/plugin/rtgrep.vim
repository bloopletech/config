function! g:RtGrep(path)
  let l:path_hash = "_".getpid()
  execute "silent !~/key/rtgrep/rtgrep_stay ".a:path." ".l:path_hash

  let l:locators = readfile("/tmp/rtgrep_stay_".l:path_hash)
  "delete(l:locators)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".l:locators[0]
  endif
  redraw!
endfunction

function! s:RemoveRtGrepStay()
  let l:path_hash = "_".getpid()

  call system("~/key/rtgrep/rtgrep_stay --kill ".l:path_hash)
  call delete("/tmp/rtgrep_stay_".l:path_hash)
endfunction

autocmd VimLeave * call s:RemoveRtGrepStay()

command! RtGrep -nargs=1 call g:RtGrep(<args>)
