set nocompatible
set noswapfile
set backspace=indent,eol,start
set number
set guioptions-=T
set guioptions-=t
set showtabline=0
set clipboard=unnamed
set hidden

set t_Co=256
colorscheme railscasts
highlight Pmenu guifg=#E6E1DC guibg=#111111
highlight PmenuSel guifg=#E6E1DC guibg=#5A647E
highlight MBENormal gui=NONE guifg=#BC9458

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
nnoremap <S-B> :<C-u>FufBuffer<CR>

nnoremap U <C-R>
nnoremap <C-R> U

"imap <Tab> <Esc>
"nmap <Tab> <Esc>:

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
cmap <C-v> <C-r>"

nnoremap q bd
"set wildchar=<Tab> wildmenu wildmode=full
