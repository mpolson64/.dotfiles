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
set nu
set ruler
set laststatus=2
set incsearch
set hlsearch
set smartcase
set nofoldenable

" Keybinds
imap jk <Esc>
let mapleader="\<space>"
let g:mapleader="\<space>"
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

" Colors & status bar
syntax on
colorscheme dracula

" Enable loading the plugin/indent files for specific file types
filetype plugin indent on
