let g:rtgrep_tmpdir = "/tmp/rtgrep_vim_".getpid()
call mkdir(g:rtgrep_tmpdir)

function! s:RemoveRtGrepTmpdir()
  let l:stay_files = glob(g:rtgrep_tmpdir."/stay_*", 1, 1)
  for l:file in l:stay_files
    let l:stay_part = substitute(l:file, "^\\(.*\\)stay_\\([A-Za-z0-9]\\+\\).*$", "\\1stay_\\2", "g")
    call system("~/key/rtgrep/rtgrep_stay --kill ".l:stay_part)
  endfor

  call system("rm -r ".g:rtgrep_tmpdir)
endfunction

autocmd VimLeave * call s:RemoveRtGrepTmpdir()

function! g:RtGrep(path)
  let l:rtgrep_path = g:rtgrep_tmpdir."/stay_".md5#md5(a:path)
  execute "silent !~/key/rtgrep/rtgrep_stay ".a:path." ".l:rtgrep_path

  if filereadable(l:rtgrep_path."_output")
    let l:locators = readfile(l:rtgrep_path."_output")
    if !empty(l:locators)
      execute "e +".l:locators[1]." ".l:locators[0]
    endif
    redraw!
  endif
endfunction

command! RtGrep -nargs=1 call g:RtGrep(<args>)
