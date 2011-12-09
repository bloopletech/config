set nocompatible
set noswapfile
set backspace=indent,eol,start
"set number
set guioptions-=T
set guioptions-=t
set showtabline=0
set clipboard=unnamedplus
set hidden
set mouse=a

set t_Co=256
colorscheme railscasts
highlight Pmenu NONE
highlight PmenuSel NONE
highlight PmenuSel ctermbg=240
"highlight Pmenu guifg=#E6E1DC guibg=#111111 ctermbg=0
"highlight PmenuSel guifg=#E6E1DC guibg=#5A647E
"highlight MBENormal gui=NONE guifg=#BC9458

"set showmatch
"set matchtime=500

set expandtab
set shiftwidth=2
set softtabstop=2

set autoindent
set cindent
filetype indent on

set ignorecase
set incsearch
set hls

"set selectmode=mouse
"set mousemode=popup

nnoremap <S-T> :<C-u>FufFile **/<CR>
nnoremap <S-B> :<C-u>FufBuffer<CR>

nnoremap U <C-R>
nnoremap <C-R> U

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
cmap <C-v> <C-r>"

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

imap <Tab> <C-P>

"nnoremap q bd
"set wildchar=<Tab> wildmenu wildmode=full

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=wc:%{WordCount()}
