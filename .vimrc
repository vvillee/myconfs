" VIM configuration  - Ville Pulkkinen
" Some defaults I use, adapted from https://github.com/vjousse/vim-for-humans-book
"
" First, install:
" https://github.com/tpope/vim-pathogen
"
" Then, add to ~/.vim/bundle
" https://github.com/altercation/vim-colors-solarized
" https://github.com/tpope/vim-commentary <-- commenting plugin
"
" and optionally:
" https://github.com/tpope/vim-sensible <-- sensible configuration for vim
" https://github.com/sheerun/vim-polyglot <-- vim language pack
" https://github.com/vim-syntastic/syntastic <-- syntax checker (needs external tools like jshint)
"
" language packs for vim-polyglot and vim-commentary as needed...
"

set t_Co=256

set nocompatible " no compatibility with vi

" Activate pathoghen
execute pathogen#infect()

syntax on " enable syntax highlighting

filetype plugin indent on " enable file spesific behavior like syntax highlighting and indentation
set tabstop=2 " tab intend with 2 spaces
set shiftwidth=2 " when indenting with '>', use 2 spaces
set expandtab " when pressing tab, insert spaces

set background=dark

" Set solarized confs
let g:solarized_termcolors=256
colorscheme solarized

set guioptions=T " enable the toolbar

set scrolloff=3 " display atleast 3 lines around your cursor

set title
set number
set ruler
set wrap
set visualbell

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

" set leader
let mapleader=";"

" vim-commentary: comment with leader + /
noremap <Leader>/ :Commentary<cr>

" vim-syntastic: suggested defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e
