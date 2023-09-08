
syntax on

set number

set scrolloff=30

set tabstop=4

set wildmenu

"call plug#begin('~/.vim/plugged')

call plug#begin()

Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'https://github.com/nordtheme/vim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/ku1ik/vim-monokai'
Plug 'https://github.com/dracula/vim'

call plug#end()

" colorscheme nord
" colorscheme dracula
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:fzf_action = { 'enter': 'tab split' }

