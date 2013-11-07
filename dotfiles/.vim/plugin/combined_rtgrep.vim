function! s:BuffersXref()
  let l:output = g:rtgrep_tmpdir."/currently_open_buffers"

  if bufname("%") == ""
    call writefile([], l:output)
    return l:output
  end

  silent redir => l:ls
  silent ls
  silent redir END
  let l:buffers = ["!_TAG_COLLECTION_NAME\tCurrently Open Buffers"]
  call extend(l:buffers, filter(split(l:ls, "\n"), "len(v:val) > 0"))

  let l:pattern = '^\s*\(\d\+\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)"\(.\{-}\)" \+line *\(\d\+\)\s*$'
  let l:replacement = '\=fnamemodify(submatch(8), ":.")."\t".fnamemodify(submatch(8), ":.")."\t".submatch(9).";\"\t".(submatch(3) == "%" ? "B" : "b")'
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

  let l:btags_path = system("btags path ".shellescape(a:path))
  if glob(l:btags_path) == ""
    let l:btags_path = "/dev/null"
  end

  let l:link_current_path = system("readlink -n ".l:output) 
  if l:link_current_path != "" && l:link_current_path == l:btags_path
    return l:output
  end
  call system("ln -nfs ".shellescape(l:btags_path)." ".l:output)

  return l:output
endfunction

function! s:MixedRtGrep(...)
  let l:tagger = "cd ".shellescape(getcwd())." && btags"

  if system(l:tagger." path") == "Not a btags project\n"
    execute "silent !clear && echo 'Creating btags project...' && ".l:tagger
  end

  let l:files = []

  if index(a:000, "buffers") >= 0
    call add(l:files, s:BuffersXref())
  end

  if index(a:000, "current_file") >= 0
    if !exists("b:combined_rtgrep_current_file")
      let b:combined_rtgrep_current_file = s:BtagsXref(expand("%:p"), "current_file")
    end
    call add(l:files, b:combined_rtgrep_current_file)
  end

  if index(a:000, "project_wide") >= 0
    if !exists("b:combined_rtgrep_project_wide")
      let b:combined_rtgrep_project_wide = s:BtagsXref(getcwd(), "project_wide")
    end
    call add(l:files, b:combined_rtgrep_project_wide)
  end

  call g:RtGrep(join(l:files, " "), l:tagger)
endfunction

command! CurrentRtGrep call s:MixedRtGrep("current_file")
command! BuffersRtGrep call s:MixedRtGrep("buffers")
command! CombinedRtGrep call s:MixedRtGrep("buffers", "current_file", "project_wide")
