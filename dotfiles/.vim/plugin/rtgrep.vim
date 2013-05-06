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
  let l:rtgrep_path = g:rtgrep_tmpdir."/stay_".md5#md5(a:path)
  let l:cmd = "silent !"
  if a:tagger != ""
    let l:cmd .= "RTGREP_TAGGER=".shellescape(a:tagger)." "
  endif
  let l:cmd .= "RTGREP_PATH=".shellescape(l:rtgrep_path)." RTGREP_MAP_KIND=1 rtgrep_stay ".a:path
  execute l:cmd

  if filereadable(l:rtgrep_path."_output")
    let l:locators = readfile(l:rtgrep_path."_output")
    if !empty(l:locators)
      execute "e +".l:locators[1]." ".escape(l:locators[0], ' \')
    endif
  endif
  redraw!
endfunction

command! RtGrep -nargs=1 call g:RtGrep(<args>)
