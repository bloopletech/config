function! g:RtGrep(path)
  let l:output = tempname()
  let l:cmd = "RTGREP_MAP_KIND=1 ~/key/rtgrep/rtgrep ".a:path." 2>".l:output
  execute "silent !".l:cmd
  let l:locators = readfile(l:output)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".l:locators[0]
  endif
  redraw!
endfunction

command! RtGrep -nargs=1 call g:RtGrep(<args>)
