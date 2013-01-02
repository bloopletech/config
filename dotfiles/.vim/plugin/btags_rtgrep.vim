function! s:BtagsRtGrep(path)
  let l:srcpath = system("realpath ".shellescape(a:path))
  let l:tagspath = substitute(system("~/key/btags/btags ".l:srcpath), "\n", "", "")

  call g:RtGrep(l:tagspath)
endfunction

function! s:BtagsAll()
  call s:BtagsRtGrep(getcwd())
endfunction

function! s:BtagsBuffer()
  call s:BtagsRtGrep(expand("%"))
endfunction

command! BtagsAll call s:BtagsAll()
command! BtagsBuffer call s:BtagsBuffer()
