function! s:BuffersXref()
  silent redir => l:ls
  silent ls
  silent redir END
  let l:buffers = filter(split(l:ls, "\n"), "len(v:val) > 0")

  let l:output = tempname()
  let l:pattern = '^\s*\(\d\+\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)"\(.\{-}\)" \+line *\(\d\+\)\s*$'
  let l:replacement = '\=fnamemodify(submatch(8), ":.")." ".(submatch(3) == "%" ? " current " : "")."buffer ".submatch(9)." ".fnamemodify(submatch(8), ":.")." ".(submatch(3) == "%" ? "current " : "")."buffer"'
  call map(l:buffers, 'substitute(l:buffers[v:key], l:pattern, l:replacement, "")')
  call writefile(l:buffers, l:output)

  return l:output
endfunction

function! s:BtagsXref(path)
  let l:srcpath = system("realpath ".shellescape(a:path))
  let l:tagspath = substitute(system("~/key/btags/btags ".l:srcpath), "\n", "", "")

  return l:tagspath
endfunction

function! s:CombinedRtGrep()
  let l:files = []
  if bufname("%") != ""
    call add(l:files, s:BuffersXref())
  endif
  if glob(expand("%")) != ""
    call add(l:files, s:BtagsXref(expand("%")))
  endif
  call add(l:files, s:BtagsXref(getcwd()))

  call g:RtGrep(join(l:files, " "))
endfunction

command! CombinedRtGrep call s:CombinedRtGrep()
