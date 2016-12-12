" VIM configuration  - Ville Pulkkinen
" Some defaults I use, adapted from https://github.com/vjousse/vim-for-humans-book
"
" First, install:
" https://github.com/tpope/vim-pathogen
" https://github.com/altercation/vim-colors-solarized
" 
" and optionally install:
" https://github.com/tpope/vim-sensible

set t_Co=256

set nocompatible 			" no compatibility with vi

" Activate pathoghen
execute pathogen#infect() 

syntax on " enable syntax highlighting

filetype plugin indent on " enable file spesific behavior like syntax highlighting and indentation

set background=dark

" install https://github.com/altercation/vim-colors-solarized
let g:solarized_termcolors=256
colorscheme solarized

set guioptions=T " enable the toolbar

set scrolloff=3 " display atleast 3 lines around your cursor

set title
set number
set ruler
set wrap

" -- search
set ignorecase
set smartcase

set incsearch
set hlsearch

" -- disable directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

