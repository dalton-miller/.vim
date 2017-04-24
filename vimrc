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
Plug 'yggdroot/indentline'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'xuyuanp/nerdtree-git-plugin'
call plug#end()

set encoding=utf8
let NERDTreeMapOpenInTab='<ENTER>'
let g:molokai_original = 1
colo molokai

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:used_javascript_libs = 'react,vue'
let g:jsx_ext_required = 0

