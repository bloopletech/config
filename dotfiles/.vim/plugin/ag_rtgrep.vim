function! s:AgRtGrep(query)
  let l:output = tempname()
  call system('ag --search-files --nocolor --noheading --nobreak '.shellescape(a:query).' | sed ''s/ /\x00/g'' | sed ''s/^\([^:]*\):\([0-9]\+\):[\t\x00]*\(.\+\)[\t\x00]*$/\3 search \2 \1 search/g'' >'.l:output)

  call g:RtGrep(l:output)
endfunction

command! -nargs=* AgQuery call s:AgRtGrep(<q-args>)
