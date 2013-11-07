if !exists("g:rtgrep_executable")
  let g:rtgrep_executable = "rtgrep"
endif

let g:rtgrep_tmpdir = "/tmp/rtgrep_vim_".getpid()
call mkdir(g:rtgrep_tmpdir)

function! s:RemoveRtGrepTmpdir()
  let l:stay_files = glob(g:rtgrep_tmpdir."/stay_*", 1, 1)
  for l:file in l:stay_files
    let l:stay_part = substitute(l:file, "^\\(.*\\)stay_\\([A-Za-z0-9]\\+\\).*$", "\\1stay_\\2", "g")
    call system("RTGREP_PATH=".shellescape(l:stay_part)." rtgrep_stay --kill")
  endfor

  call system("rm -r ".g:rtgrep_tmpdir)
endfunction

autocmd VimLeave * call s:RemoveRtGrepTmpdir()

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
