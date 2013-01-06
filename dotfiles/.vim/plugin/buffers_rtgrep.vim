function! s:BuffersRtGrep()
  silent redir => l:ls
  silent ls
  silent redir END
  let l:buffers = filter(split(l:ls, "\n"), "len(v:val) > 0")

  let l:output = tempname()
  let l:pattern = '^\s*\(\d\+\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)"\(.\{-}\)" \+line *\(\d\+\)\s*$'
  let l:replacement = '\=submatch(8)." ".submatch(9)." ".submatch(8)." ".(submatch(3) == "%" ? "current buffer" : "")'
  call map(l:buffers, 'substitute(l:buffers[v:key], l:pattern, l:replacement, "")')
  call writefile(l:buffers, l:output)

  call g:RtGrep(l:output)
endfunction

command! BuffersRtGrep call s:BuffersRtGrep()
