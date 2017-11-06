" VIM configuration  - Ville Pulkkinen
"
" Cheat sheets:
" https://github.com/jordanhudgens/vim-settings/blob/master/vim-cheat-sheet.md
" http://www.viemu.com/vi-vim-cheat-sheet.gif
"
set t_Co=256

set nocompatible " no compatibility with vi

" Activate pathoghen
" If activating, first install: https://github.com/tpope/vim-pathogen
" execute pathogen#infect()

" Use vundle instead of pathogen
" 1) $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2) $ vim +PluginInstall +qall
" alternative 2) :PluginInstall command in vim
source ~/myconfs/.vundle

syntax on " enable syntax highlighting

set background=dark
"
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

" mappings for adding a newline before/after without switching to insert mode
nmap <C-K> O<Esc>j
nmap <C-J> o<Esc>k
nmap <CR> <C-K>

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
nnoremap <silent> <Leader>j :exe "resize -10"<CR>
nnoremap <silent> <Leader>k :exe "resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize -10"<CR>

" -- Nerdtree (https://github.com/scrooloose/nerdtree.git)
" open nerdtree automatically upon a startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Ctrl + n to open nerdtree
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <C-n>

" map leader p to fuzzy search
map <Leader>p <C-p>

" map jj to esc
imap jj <Esc>

" map backspace in normal mode to delete normally
nnoremap <BS> X

" map arrow keys left and right to switch windows
nmap <silent> <Left> :wincmd w<CR>
nmap <silent> <Right> :wincmd w<CR>

" map leader s to split window vertically and leader S horizontally
nmap <Leader>s <C-w>v
nmap <Leader>S <C-w>S

" map arrow keys up and down to go up and down by page
map <silent> <Up> <C-u>
map <silent> <Down> <C-d>

" map shift+j half page down and shift+k half page up
nmap J <nop>
nmap K <nop>
nmap J <C-d>
nmap K <C-u>

" add QA to quit all buffers in vim without saving and QS with saving
map QA :qa!<CR>
map QS :wqa<CR>

" map Q to close window
nmap Q <nop>
nmap <silent> Q :q<CR>

" add abbreviations for array and curly brackets
ab arr []<Esc>i
ab bra {}<Esc>bli<CR><Esc>O

" always add closing char for these chars
inoremap ( ()<Left>
inoremap () ()
inoremap " ""<Left>
inoremap "" ""
inoremap ' ''<Left>
inoremap '' ''
inoremap < <><Left>
inoremap <> <>
inoremap [ []<Left>
inoremap [] []
inoremap { {}<Left>
inoremap {} {}

