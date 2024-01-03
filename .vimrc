if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" autocmd VimEnter * stopinsert
" autocmd VimLeave * startinsert

set mouse=a

filetype on

filetype indent on

set tabstop=4

set incsearch

set nowrap

set showmode

set cursorline

syntax on

set number

" set scrolloff=30

" set tabstop=4

set wildmenu

set termguicolors

filetype plugin on

hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred     guifg=white
" hi Normal ctermfg=#0080FF ctermbg=#333B4A
hi Cursor ctermbg=15 ctermfg=8
hi CursorLine gui=underline cterm=underline
hi CursorLine gui=underline cterm=underline  ctermbg=8 ctermfg=15 "8 =     dark gray, 15 = white


call plug#begin('~/.vim/plugged')

"call plug#begin()
" Plug 'ap/vim-css-color'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/drewtempelmeyer/palenight.vim'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'https://github.com/tpope/vim-commentary'

call plug#end()

" colorscheme nord
" colorscheme slate
" colorscheme dracula
colorscheme palenight
" colorscheme onedark

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:fzf_action = { 'enter': 'tab split' }
" let g:colorizer_auto_color = 1
" let g:colorizer_syntax = 1
" let g:colorizer_hex_pattern = ['#', '\%(\x\{3}\|\x\{6}\)', '']
" au BufNewFile,BufRead *.css,*.html,*.htm  :ColorHighlight!
" augroup auto_colorize
" autocmd!
" autocmd FileType * :ColorHighlight
nnoremap <C-c> :ColorHighlight<CR>
" augroup END
" let g:colorizer_skip_comments = 1
" let g:colorizer_disable_bufleave = 1
" let g:colorizer_debug = 1

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" resize current buffer by +/- 5 
nnoremap <C-left> :vertical resize +5<cr>
nnoremap <C-down> :resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-right> :vertical resize -5<cr>

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
noremap <C-b> <Esc>:w<CR>:! ./%<CR>
" Nerd_Commenter

" Create default mappings

let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


 let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
      \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
      \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
      \ 'gundo': [ 'Gundo', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
      \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
      \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
      \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
      \ }

" augroup cursor_behaviour
"     autocmd!

"     " reset cursor on start:
"     autocmd VimEnter * silent !echo -ne "\e[2 q"
"     " cursor blinking bar on insert mode
"     let &t_SI = "\e[5 q"
"     " cursor steady block on command mode
"     let &t_EI = "\e[2 q"

"     " highlight current line when in insert mode
"     autocmd InsertEnter * set cursorline
"     " turn off current line highlighting when leaving insert mode
"     autocmd InsertLeave * set nocursorline

" augroup END

augroup CustomCursorLine
au!    
au VimEnter * :hi! CursorLine gui=underline cterm=underline
augroup END


highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon1
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait10


if &term =~ '^xterm\|rxvt'
  " solid underscore
  let &t_SI .= "\<Esc>[6 q"
  " solid block
  let &t_EI .= "\<Esc>1 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
