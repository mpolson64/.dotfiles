" Load plugins
if filereadable(expand("~/.vim/vundle.vim"))
    source ~/.vim/vundle.vim
endif

" General
filetype plugin on
filetype indent on
set wildmenu
set nocompatible
set history=1024
set autoread
set splitbelow
set splitright
set rnu
set ruler
set laststatus=2

" Keybinds
imap jk <Esc>
let mapleader=','
let g:mapleader=','
nmap <leader>w :w!<cr> " quicksave
map <C-j> <C-W>j " split navigation scheme
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>tn :tabnew<cr> " tab navigation scheme
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

" Commands
command W w !sudo tee % > /dev/null/

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
let g:indent_guides_guide_size = 1

" Colors
syntax on
if &t_Co >= 256
    colorscheme solarized
    set background=dark
endif

" Enable loading the plugin/indent files for specific file types
filetype plugin indent on
