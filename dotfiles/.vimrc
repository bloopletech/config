"Options
set nocompatible
set noswapfile
set backspace=indent,eol,start
set number
set clipboard=unnamedplus
set hidden
set mouse=a
set linebreak
set cursorline
filetype plugin on

"Syntax highlighting
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
highlight LineNr ctermfg=240 ctermbg=NONE
highlight clear CursorLine
highlight CursorLine ctermbg=234
highlight clear CursorLineNr
highlight CursorLineNr ctermfg=249 ctermbg=NONE

"set showmatch
"set matchtime=500

"Spaces instead of tabs
set expandtab
set shiftwidth=2
set softtabstop=2

"Indenting
set autoindent
set cindent
filetype plugin on

"Searching
set ignorecase
set gdefault
set incsearch
set hls

"Settings for system() and :! commands
set shell=bash
set shellpipe=\ 2>&1\ >

"File navigation and search plugins
nnoremap <C-G> :AgSearch 

nnoremap <S-B> :BuffersRtGrep<CR>
nnoremap <S-T> :BtagsAll<CR>
nnoremap <C-S-T> :BtagsBuffer<CR>

"Completion
inoremap <Tab> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-X>\<lt>C-N>"<CR>
inoremap <CR> <C-R>=pumvisible() ? "\<lt>C-Y>" : "\<lt>CR>"<CR>

"Undo/redo
nnoremap U <C-R>
nnoremap <C-R> U

"imap <Tab> <Esc>
"nmap <Tab> <Esc>:

"Copy and Paste
vnoremap <C-c> "+y
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa
cnoremap <C-v> <C-r>+
noremap <C-a> gg"+yG

"Navigation treating wrapped lines as separate
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"Navigating (possibly wrapped) lines using the arrow key
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"Navigating (possibly wrapped) lines using the arrow key, including in popup menus
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-o>gj"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-P>" : "\<lt>C-o>gk"<CR>


"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=wc:%{WordCount()}

au BufNewFile,BufRead *.less set filetype=less

"Text file editing
au BufRead,BufNewFile *.txt setlocal spell spelllang=en_au
au BufRead,BufNewFile *.txt setlocal wrap linebreak textwidth=100

imap <C-s> <C-x>s
