" Load plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'w0rp/ale'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'sheerun/vim-polyglot'

Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'

call plug#end()

" General
filetype plugin indent on
set expandtab
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

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" ALE configuration
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Easy Motion configuration
let g:EasyMotion_smartcase = 1

nmap f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-s2)

" Keybinds
imap jk <Esc> " more comfortable return to normal mode

let mapleader="\<space>"
let g:mapleader="\<space>"
map <leader>w :w!<cr> " quicksave
map <leader>tn :tabnew<cr> " tab navigation scheme
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>
map <C-p> :CtrlP<cr>

" Commands
command W w !sudo tee % > /dev/null/

" Colors & status bar
syntax on
colorscheme dracula

" LaTEX
let g:tex_flavor = "latex"
