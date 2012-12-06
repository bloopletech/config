set showtabline=2

autocmd BufEnter * :let t:wd = getcwd()
"autocmd BufNewFile * :let t:wd = getcwd()

function! GuiTabLabel()
  return gettabvar(v:lnum, "wd")
endfunction

set guitablabel=%{GuiTabLabel()}

set guifont=Monospace\ 11


map <C-T> :tabnew<CR>
