function! s:GetGlobalPath()
  return substitute(system("global -p"), "\n", "", "")."/tags_dump.txt"
endfunction

function! s:RtGrep()
  if "" == glob(s:GetGlobalPath())
    echo "Generating tags for first run..."
    let l:ignore = system("cd ".shellescape(getcwd())." && generate_and_dump_tags")
  endif

  let l:output = tempname()
  let l:cmd = "~/key/rtgrep/rtgrep.rb ".s:GetGlobalPath()." 2>".l:output
  execute "silent !".l:cmd
  let l:locators = readfile(l:output)
  if !empty(l:locators)
    execute "e +".l:locators[1]." ".l:locators[0]
  endif
endfunction

command! RtGrep call s:RtGrep()
