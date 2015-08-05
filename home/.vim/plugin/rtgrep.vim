if !exists("g:rtgrep_executable")
  let g:rtgrep_executable = "rtgrep"
endif

function! g:RtGrep(path, tagger)
  let l:output = tempname()
  let l:cmd = "RTGREP_TAGGER=".shellescape(a:tagger)." ".g:rtgrep_executable." ".a:path." 2>".l:output
  execute "silent !".l:cmd

  let l:locators = readfile(l:output)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".escape(l:locators[0], ' \')
  endif
  redraw!
endfunction

command! RtGrep -nargs=1 call g:RtGrep(<args>)
