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
" let g:solarized_termcolors=256
colorscheme solarized

set scrolloff=5 " display atleast x lines around your cursor

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

" set leader
let mapleader=";"

" vim-commentary: comment with leader + /
noremap <Leader>/ :Commentary<cr>

" vim-syntastic: suggested defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

" shortcut for syntastic check
noremap <Leader>! :SyntasticCheck<cr>

let g:netrw_xstrlen = 0

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" indent guides configuration
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Window pane resizing
nnoremap <silent> <Leader>j :exe "resize -10"<CR>
nnoremap <silent> <Leader>k :exe "resize +10"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize -10"<CR>

" Redraw window
noremap <silent> <Leader>R :redraw!<CR>

let g:ctrlp_show_hidden = 0

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" map jj to esc
imap jj <Esc>

" toggle paste mode
map <leader>sp :setlocal paste!<cr>

" * and # search for visual mode also
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" map go to tag to ctrl + g
nmap <C-g> <C-]>

" rebuild tags with RT
map RT :!sh -xc 'ctags -R -f tags'<CR>

call togglebg#map("<F5>")

" UltiSnips trigger configuration
let g:UltiSnipsExpandTrigger="<C-l>"
" UltiSnips add html to js-files
autocmd FileType javascript UltiSnipsAddFiletypes html
