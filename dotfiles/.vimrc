set nocompatible
set noswapfile
set backspace=indent,eol,start
set number
set guioptions-=T
set guioptions-=t
set showtabline=0
set clipboard=unnamed

set t_Co=256
colorscheme railscasts
highlight Pmenu guifg=#E6E1DC guibg=#111111
highlight PmenuSel guifg=#E6E1DC guibg=#5A647E

"set showmatch
"set matchtime=500

set expandtab
set autoindent
set shiftwidth=2

set ignorecase
set incsearch
set hls

set selectmode=mouse

nnoremap <S-T> :<C-u>FufFile **/<CR>

let fuf_keyOpen = '<C-l>'
let fuf_keyOpenTabpage = '<CR>'

"imap <Tab> <Esc>
"nmap <Tab> <Esc>:

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
cmap <C-v> <C-r>"
