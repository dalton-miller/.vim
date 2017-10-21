" autocmds
" autoload nerdtree when starting without a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" plugins
call plug#begin()
" nerdtree
Plug 'scrooloose/nerdtree'
" colors
" Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
" syntax for js
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
" better status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git integration
Plug 'tpope/vim-fugitive'
call plug#end()

" map keyboard shortcuts
" Ctrl-n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" color scheme and appearance
syntax enable
" set background=dark
colorscheme molokai
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
