call plug#begin('~/.vim/plugs')

" Themes
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'

" Editing
Plug 'terryma/vim-multiple-cursors'

" Command Line
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdtree'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'shinchu/lightline-gruvbox.vim'

" Misc
Plug 'ervandew/supertab'
Plug 'davidoc/taskpaper.vim'
Plug 'tpope/vim-sensible'

" Comments
Plug 'tpope/vim-commentary'

" Formatting
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'

" Local Plugs
if filereadable(expand('~/.plugs.local'))
  source ~/.plugs.local
endif

call plug#end()

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

syntax enable
colorscheme gruvbox
set number
set bg=dark
set completeopt=menu,longest
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set belloff=all
set shell=/bin/zsh
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ensure ale temp files persist when sleeping
set dir=~/tmp

" Ggrep pops up quick fix window
autocmd QuickFixCmdPost *grep* cwindow

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowIgnoredStatus = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Change mappings.
let mapleader = "\<Space>"

noremap <leader>w :NERDTreeToggle<CR>
noremap <leader>e :BufExplorer<CR>
noremap <leader>a :copen<CR>
noremap <leader>o :lopen<CR>
noremap <leader>d :ALEDetail<CR>
noremap <leader>j :BookmarkToggle<CR>
noremap <leader>n :BookmarkAnnotate<CR>
noremap <leader>l :BookmarkShowAll<CR>

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:lightline#ale#indicator_checking = "???"
let g:lightline#ale#indicator_warnings = "WARN "
let g:lightline#ale#indicator_errors = "ERR "
let g:lightline#ale#indicator_ok = "OK"

" Local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
