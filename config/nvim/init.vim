" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'godlygeek/tabular'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript'

Plug 'arakashic/chromatica.nvim'

Plug 'plasticboy/vim-markdown'

Plug 'Shougo/neco-vim'

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

" Plugin configuraion
let g:UltiSnipsExpandTrigger = ';'

" Keybinds
imap jk <Esc> " more comfortable return to normal mode
tmap <Esc> <C-\><C-n> " exit terminal with escape
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>" " autocomplete with tab

let mapleader="\<space>"
let g:mapleader="\<space>"
nmap <leader>w :w!<cr> " quicksave
"map <C-j> <C-W>j " split navigation scheme
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
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
