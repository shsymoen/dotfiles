" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Pathogen load
filetype off

" set the runtime path to include pathogen and initialize
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

" enable syntax highlighting
syntax on

" show line numbers
set number

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

" Settings fro python-mode
let g:pymode_python = 'python3'
map <Leader>g :call RopeGotoDefinition()<CR>

" set to autoread when a file is changed from the outside
set autoread

" set mouse input
set mouse=a
set selectmode=mouse
