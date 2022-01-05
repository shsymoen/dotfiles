" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
" runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Pathogen load
filetype off
set nocp

" set the runtime path to include pathogen and initialize
set rtp+=~/.vim/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" Add all your plugins here (note older versions of Vundle used Bundle)
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"
"" All Plugins must be added before following line
"call vundle#end()
filetype plugin indent on

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" enable syntax highlighting
syntax on

" show line numbers
set number

" no backup and swapfiles
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs int spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline
hi CursorLine cterm=NONE ctermbg=DarkGrey

" show the matching part of the pair for {} [] and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" enable cycle menu for autocompletion
set wildmenu

" Highlight matched words
set hlsearch

" Turn off highlighted words with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Different leader character
let mapleader=","

" jk is escape
inoremap jk <esc>

" Start CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" easier moving between windows
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" more natural splits
set splitbelow
set splitright

" easier indentation
vnoremap < <gv
vnoremap > >gv

" Show end of columns
set tw=79
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Python enable folding
set nofoldenable

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8 |

" Settings for YouCompleteMe
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" set to autoread when a file is changed from the outside
set autoread

" set mouse input
set mouse=a
set selectmode=mouse

" powerline settings
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab

" load NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.pyc$'] " Ignore files in NERDTree

" Set default line lenght of Black fixer to 79

" settings for A.L.E.
" Check Python files with flake8 and pylint.
let g:ale_linters = {
            \ 'python': ['flake8', 'pylint']
            \}
" Fix Python files with autopep8 and yapf
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['isort', 'autoflake', 'black']
            \}
" Disable warnings about trailing whitespaace for Python files
let g:ale_warn_about_trailing_whitespace = 0
" Fix the file when saving
let g:ale_fix_on_save = 1
" Don't interrupt while writing
let g:ale_lint_on_text_changed = 'never'
" No errors while opening a file
let g:ale_lint_on_enter = 0
" Black has default 88 line length, which is different than flake8 and pep
" standard
let g:ale_python_black_options = '--line-length=79'

" settings for flake8 PEP8 Python format testing
let g:flake8_show_quickfix=1 "quickfix window opens
let g:flake8_show_in_file=1 "show markers in the file

" Enable Tagbar
nmap <F8> :TagbarToggle<CR>

" Smooth scrolling
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize -2<CR>
    nnoremap <Right> :vertical resize +2<CR>
endif

" to have proper color scheme in tmux
set background=dark
set t_Co=256

" When saving remove trailing spaces
autocmd BufWritePre *.py %s/\s\+$//e

" python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF
