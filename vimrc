let g:python_host_skip_check=1
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
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" neomake
Plug 'neomake/neomake'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" indent lines
Plug 'yggdroot/indentline'
" bracket completion
Plug 'jiangmiao/auto-pairs'
" tag completion
Plug 'alvan/vim-closetag'
" colors
" Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
" syntax for js
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
" syntax for typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ninja-1/nvim-typescript', {'do': './install.sh'}
" syntax for vue
Plug 'posva/vim-vue'
" syntax for go
Plug 'fatih/vim-go'
" syntax for elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
" syntax for nim
Plug 'zah/nim.vim'
" better status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git integration
Plug 'tpope/vim-fugitive'
Plug 'arithran/vim-delete-hidden-buffers'
call plug#end()

" use rg for fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

map <C-S-f> :Rg<CR>

" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'vue',
  \ 'js'
  \ ]

" enable neomake
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_tsc_exe = $PWD .'/node_modules/.bin/tsc'
let g:neomake_typescript_tslint_exe = $PWD .'/node_modules/.bin/tslint'
let g:neomake_typescript_enabled_makers = []

call neomake#configure#automake('rw', 1000)

" nvim-typescript settings
let g:nvim_typescript#vue_support = 1
let g:nvim_typescript#diagnostics_on_change = 0

" auto complete closing tags in these file types
let g:closetag_filenames = '*.html,*.xhtml,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.vue'

" map keyboard shortcuts
" Ctrl-n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
