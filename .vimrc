" author: lucas
set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler                       "Add the current line and column"
set term=xterm-256color

" don't use arrowkeys, gotta break this bad habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

filetype on                     "Enable file type detection
syntax on                       "Enable syntax highlighting

" =============== Plug Initialization ===============

" This installs plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'powerline/powerline'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Themes
"let g:dracula_italic = 0
colorscheme dracula
"highlight Normal ctermbg=None

"if (has("termguicolors"))
"  set termguicolors
"endif

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ================ Custom Commands ======================

command Sp :setlocal spell! spell?
