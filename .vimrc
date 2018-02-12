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

" Set backups off
set nobackup
set nowb
set noswapfile

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
nmap <C-k> O<Esc>j
nmap <C-j> o<Esc>k

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

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_generic = 1

" shortcut for syntastic check
noremap <Leader>! :SyntasticCheck<cr>

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Window pane resizing
nnoremap <silent> <Leader>j :exe "resize -10"<CR>
nnoremap <silent> <Leader>k :exe "resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize -10"<CR>

" Window resize to equal sizes
noremap <silent> <Leader>r <C-w>=

" Redraw window
noremap <silent> <Leader>R :redraw!<CR>

" -- Nerdtree (https://github.com/scrooloose/nerdtree.git)
" open nerdtree automatically upon a startup if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Ctrl + n to open nerdtree
map <C-n> :NERDTreeToggle<CR>
map <Leader>n <C-n>

" map leader p to fuzzy search
map <Leader>p <C-p>
let g:ctrlp_show_hidden = 1

" map leader P to fuzzy tag search
map <Leader>P :CtrlPTag<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" map jj to esc
imap jj <Esc>

" map backspace in normal mode to delete normally
nnoremap <BS> X

" toggle paste mode
map <leader>sp :setlocal paste!<cr>

" map arrow keys left and right to switch windows
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" map leader v to split window vertically and leader S horizontally
nmap <Leader>v <C-w>v
nmap <Leader>S <C-w>S

" map arrow keys up and down to go up and down by page
map <silent> <Up> <C-u>
map <silent> <Down> <C-d>

" map shift+j half page down and shift+k half page up
nnoremap J <nop>
nnoremap K <nop>
nnoremap J <C-d>
nnoremap K <C-u>

" add QA to quit all buffers in vim without saving
map QA :qa!<CR>

" map Q to close window
nmap Q <nop>
nmap <silent> Q :q<CR>

" add abbreviations for array and curly brackets
ab arr []<Esc>i
ab sq []<Esc>i
ab bra {}<Esc>bli<CR><Esc>O
ab bras {}<Esc>i
ab quot ''<Esc>i
ab dquot ""<Esc>i

" * and # search for visual mode also
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" map tag to ctrl or leader + g
nmap <C-g> <C-]>
nmap <Leader>g <C-]>

" rebuild tags with RT
map RT :!sh -xc 'ctags -R -f tags'<CR>

