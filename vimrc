autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-obsession'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'posva/vim-vue'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set encoding=utf8
set lazyredraw
set ttyfast
set expandtab
set shiftwidth=2
set softtabstop=2
let NERDTreeMapOpenInTab='<ENTER>'
let g:molokai_original = 1
colo molokai

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:used_javascript_libs = 'react,vue'
let g:jsx_ext_required = 0
set fillchars=diff:·
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = '0'

" keymaps
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
