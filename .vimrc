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
" https://github.com/vim-syntastic/syntastic <-- syntax checker (needs external tools like jshint)
" https://github.com/ctrlpvim/ctrlp.vim <-- Fuzzy search with ctrl + p
" https://github.com/scrooloose/nerdtree.git <-- Nerdtree file explorer
" https://github.com/tpope/vim-endwise <-- Add end etc. to the end of the block
" https://github.com/ervandew/supertab.git <-- light weight code completition
"
" Cheat sheets:
" https://github.com/jordanhudgens/vim-settings/blob/master/vim-cheat-sheet.md
" http://www.viemu.com/vi-vim-cheat-sheet.gif

set t_Co=256

set nocompatible " no compatibility with vi

" Activate pathoghen
execute pathogen#infect()

syntax on " enable syntax highlighting

set background=dark

" Set solarized confs
let g:solarized_termcolors=256
colorscheme solarized

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

" -- Indentation
set autoindent
set smartindent
set smarttab " convert tabs to spaces
set tabstop=2 " tab intend with 2 spaces
set shiftwidth=2 " when indenting with '>', use 2 spaces
set softtabstop=2
set expandtab " when pressing tab, insert spaces

filetype plugin indent on " enable file spesific behavior like syntax highlighting and indentation

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

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
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']

" shortcut for syntastic check
noremap <Leader>! :SyntasticCheck<cr>

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Window pane resizing
nnoremap <silent> <Leader>> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "resize " . (winheight(0) * 2/3)<CR>

" -- Nerdtree (https://github.com/scrooloose/nerdtree.git)
" open nerdtree automatically upon a startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Ctrl + n to open nerdtree
map <C-n> :NERDTreeToggle<CR>
