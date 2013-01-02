set nocompatible
set noswapfile
set backspace=indent,eol,start
"set number
set clipboard=unnamedplus
"set clipboard=unnamed
set hidden
set mouse=a
set linebreak

syntax on
set t_Co=256
colorscheme railscasts
highlight Pmenu NONE
highlight PmenuSel NONE
highlight PmenuSel ctermbg=240
highlight! link SpellCap SpellBad
highlight! link SpellRare SpellBad
highlight! link SpellLocal SpellBad
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
set gdefault
set incsearch
set hls

"set selectmode=mouse
"set mousemode=popup

set shell=bash
set shellpipe=\ 2>&1\ >
let g:ackprg = "ag --nocolor --nogroup --column "
let g:ack_qhandler = "CtrlPQuickfix"

nnoremap <C-G> :Ack 

let g:ctrlp_map = '<Tab>'
let g:ctrlp_max_height = 150
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = "ag --nocolor -g '.' %s"

nnoremap <S-B> :CtrlPBuffer<CR>
"nnoremap <S-B> :CtrlPBufTag<CR>
"nnoremap <C-S-B> :CtrlPBufTagAll<CR>

nnoremap <S-T> :BtagsAll<CR>
nnoremap <C-S-T> :BtagsBuffer<CR>

nnoremap U <C-R>
nnoremap <C-R> U

"imap <Tab> <Esc>
"nmap <Tab> <Esc>:

vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
cmap <C-v> <C-r>+
map <C-a> gg"+yG

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-o>gj"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-P>" : "\<lt>C-o>gk"<CR>

imap <Tab> <C-P>

"nnoremap q bd
"set wildchar=<Tab> wildmenu wildmode=full

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=wc:%{WordCount()}

au BufNewFile,BufRead *.less set filetype=less

au BufRead,BufNewFile *.txt setlocal spell spelllang=en_au
au BufRead,BufNewFile *.txt setlocal wrap linebreak textwidth=100
"au BufRead,BufNewFile *.txt setlocal spell spelllang=en_au

imap <C-s> <C-x>s
