function! s:RtGrep()
  let l:global_path = substitute(system("global -p"), "\n", "", "")."/tags_dump.txt"
  if "" == glob(l:global_path)
    echo "Generating tags for first run..."
    let l:ignore = system("cd ".shellescape(getcwd())." && generate_and_dump_tags")
  endif

  let l:output = tempname()
  let l:cmd = "~/key/rtgrep/rtgrep.rb ".l:global_path." 2>".l:output
  execute "silent !".l:cmd
  let l:locators = readfile(l:output)
  execute "e +".l:locators[1]." ".l:locators[0]
endfunction

command! RtGrep call s:RtGrep()
