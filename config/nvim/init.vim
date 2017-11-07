" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-grepper'

Plug 'easymotion/vim-easymotion'

Plug 'godlygeek/tabular'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

Plug 'Valloric/YouCompleteMe',  { 'do': '~/.local/share/nvim/plugged/YouCompleteMe/install.py --tern-completer' }

Plug 'w0rp/ale'

Plug 'sheerun/vim-polyglot'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'

Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'


call plug#end()

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

" NERDTree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Keybinds
imap jk <Esc> " more comfortable return to normal mode
tmap <Esc> <C-\><C-n> " exit terminal with escape
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>" " autocomplete with tab

let mapleader="\<space>"
let g:mapleader="\<space>"
map <leader>w :w!<cr> " quicksave
map <leader>tn :tabnew<cr> " tab navigation scheme
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>
map <C-p> :FZF<cr>

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

" Colors & status bar
syntax on
colorscheme dracula

" Enable loading the plugin/indent files for specific file types
filetype plugin indent on
