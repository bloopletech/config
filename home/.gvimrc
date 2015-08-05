set guioptions-=T
set guioptions-=t
set guioptions-=m
set guifont=Monospace\ 11

map <C-T> <ESC>:tabnew<CR>

autocmd GuiEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
