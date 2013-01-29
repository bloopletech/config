function! g:RtGrep(path)
  let l:path_hash = "rtgrepvim_".getpid()
  execute "silent !~/key/rtgrep/rtgrep_stay ".a:path." ".l:path_hash

  let l:locators = readfile("/tmp/rtgrep_stay_".l:path_hash)
  "delete(l:locators)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".l:locators[0]
  endif
  redraw!
endfunction

command! RtGrep -nargs=1 call g:RtGrep(<args>)
