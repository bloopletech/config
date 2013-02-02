function! s:BuffersXref()
  let l:output = g:rtgrep_tmpdir."/currently_open_buffers"

  if bufname("%") == ""
    call writefile([], l:output)
    return l:output
  end

  silent redir => l:ls
  silent ls
  silent redir END
  let l:buffers = filter(split(l:ls, "\n"), "len(v:val) > 0")

  let l:pattern = '^\s*\(\d\+\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)"\(.\{-}\)" \+line *\(\d\+\)\s*$'
  let l:replacement = '\=fnamemodify(submatch(8), ":.")." ".(submatch(3) == "%" ? " current " : "")."buffer ".submatch(9)." ".fnamemodify(submatch(8), ":.")." ".(submatch(3) == "%" ? "current " : "")."buffer"'
  call map(l:buffers, 'substitute(l:buffers[v:key], l:pattern, l:replacement, "")')
  call writefile(l:buffers, l:output)

  return l:output
endfunction

function! s:BtagsXref(path, type)
  let l:output = g:rtgrep_tmpdir."/".a:type."_tags"

  if a:path == ""
    call writefile([], l:output)
    return l:output
  end

  let l:btags_path = expand("$HOME")."/.btags".(isdirectory(a:path) ? a:path."/tags.tags" : "/".a:path.".tags")
  let l:link_current_path = system("readlink -n ".l:output) 
  if l:link_current_path != "" && l:link_current_path == l:btags_path
    return l:output
  end
  call system("ln -nfs ".shellescape(l:btags_path)." ".l:output)

  return l:output
endfunction

function! s:CombinedRtGrep()
  let l:files = []
  call add(l:files, s:BuffersXref())
  call add(l:files, s:BtagsXref(expand("%:p"), "current_file"))
  call add(l:files, s:BtagsXref(getcwd(), "project_wide"))

  call g:RtGrep(join(l:files, " "), "cd ".shellescape(getcwd())." && btags")
endfunction

command! CombinedRtGrep call s:CombinedRtGrep()
