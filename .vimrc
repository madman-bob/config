" Plugins

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'

call plug#end()

" Display

syntax on " Syntax highlighting
set number " Line numbers

set laststatus=2 " Always show status bar
set statusline=%-40f\ (%y)\ %10((%l,%c)%)

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set list listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:•

" Controls

set mouse=n " Enable mouse usage
set backspace=2 " Backspace can remove everything

set expandtab
set softtabstop=4
set tabstop=4

set incsearch " Highlight pattern during search
set hlsearch " Highlight pattern after search
set ignorecase
set smartcase

set splitbelow
set splitright

" Custom commands

let mapleader=' '

nnoremap <leader>p viwpyiw

nnoremap <tab> <c-w>w
nnoremap <s-tab> <c-w>W
