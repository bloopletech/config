function! s:GetGlobalPath()
  return substitute(system("global -p"), "\n", "", "")."/tags_dump.txt"
endfunction

function! s:RtGrep(cmd_options)
  if "" == glob(s:GetGlobalPath())
    echo "Generating tags for first run..."
    let l:ignore = system("cd ".shellescape(getcwd())." && generate_and_dump_tags")
  endif

  let l:output = tempname()
  let l:cmd = "~/key/rtgrep/rtgrep.rb ".s:GetGlobalPath()." ".a:cmd_options." 2>".l:output
  execute "silent !".l:cmd
  let l:locators = readfile(l:output)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".l:locators[0]
  endif
  redraw!
endfunction

function! s:RtGrepAll()
  call s:RtGrep("")
endfunction

function! s:RtGrepBuffer()
  call s:RtGrep(shellescape(expand("%")))
endfunction

command! RtGrepAll call s:RtGrepAll()
command! RtGrepBuffer call s:RtGrepBuffer()
