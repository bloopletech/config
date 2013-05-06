"Options
set nocompatible
set ttyfast
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
filetype indent on

"Searching
set ignorecase
set gdefault
set incsearch
set hls

"Settings for system() and :! commands
set shell=bash
set shellpipe=\ 2>&1\ >

"File navigation and search plugins
nnoremap <F1> :CombinedRtGrep<CR>
nnoremap <F2> :CurrentRtGrep<CR>
nnoremap <F3> :BuffersRtGrep<CR>
nnoremap <Space> gf
nnoremap <Tab> <C-^>
nnoremap / :AgSearch 

"Navigating between files
"already have gf for go to file
nnoremap gl <C-^>
nnoremap gr :R<CR>
nnoremap ga :A<CR>

"Completion
inoremap <Tab> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>C-X>\<lt>C-N>"<CR>
inoremap <S-Tab> <C-R>=pumvisible() ? "\<lt>C-Y>\<lt>Esc>]seli\<lt>C-X>s\<lt>C-P>" : "\<lt>Esc>]seli\<lt>C-X>s\<lt>C-P>"<CR>
inoremap <S-E> <C-R>=pumvisible() ? "\<lt>C-E>\<lt>Esc>zg]seli\<lt>C-X>s\<lt>C-P>" : "E"<CR>
"inoremap <Space> <C-R>=pumvisible() ? "\<lt>CR>" : "\<lt>Space>"<CR>
let g:acp_enableAtStartup = 0
let g:acp_behaviorKeywordCommand = "\<C-X>\<C-N>"
let g:acp_mappingDriven = 1
let g:acp_behaviorRubyOmniSymbolLength = -1

"Undo/redo
nnoremap U <C-R>
nnoremap <C-R> U

"imap <Tab> <Esc>
"nmap <Tab> <Esc>:

"Copy and Paste
set virtualedit=onemore
vnoremap <C-x> d
vnoremap <C-c> m`y``
vnoremap <C-v> ""dgP
inoremap <C-v> <ESC>pa
nnoremap <C-v> gP
cnoremap <C-v> <C-r>+
noremap <C-a> ggyG

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
au BufRead,BufNewFile *.nsf setlocal wrap linebreak textwidth=100

imap <C-s> <C-x>s

"Splitting
set splitright

